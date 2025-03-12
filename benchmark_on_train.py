import polaris as po
import numpy as np
import os
import pickle
from evaluation import eval_admet, eval_potency
from astra.models.regression import regressors
import argparse

argparser = argparse.ArgumentParser()
argparser.add_argument(
    "--challenge",
    type=str,
    default="antiviral-admet-2025",
)
args = argparser.parse_args()

save_dir = f"results/{args.challenge}"
os.makedirs(save_dir, exist_ok=True)

# Load data
competition = po.load_competition(f"asap-discovery/{args.challenge}")
competition.cache()
train, _ = competition.get_train_test_split()

# Features to test
features_2d = [
    "cats2d",
    "pharm2d_cats",
    "pmapper2d",
    "desc2D",
    "estate",
    "rdkit",
    "fcfp",
    "ecfp",
]
features_3d = [
    "cats3d",
    "pharm3d_cats",
    "pmapper3d",
    "desc3D",
    "electroshape",
    "usrcat",
    "usr",
]

# Conformer generation failed for some train examples, so we need to filter them out
with open(f"features/{args.challenge}/train_conformers.pkl", "rb") as f:
    train_conformers = pickle.load(f)
valid_conformers = [conf is not None for conf in train_conformers]

results_dict = {}
for feat in features_2d + features_3d:
    print(f"Training on {feat} features")
    train_features = np.load(f"features/{args.challenge}/{feat}_train.npy")

    if np.isnan(train_features).any():
        print("Found missing values, will impute with 0s.")
        train_features = np.nan_to_num(train_features)
    results_dict[feat] = {}

    for model_name, model in regressors.items():
        y_pred_train = {}
        y_true_train = {}
        for tgt in competition.target_cols:
            y_true = train.y[tgt]
            mask = ~np.isnan(y_true)
            if feat in features_3d:
                # drop data points for which conformer generation failed
                mask = np.array(
                    [mask[i] for i in range(len(mask)) if valid_conformers[i]],
                    dtype=bool,
                )
                y_true = np.array(
                    [y_true[i] for i in range(len(y_true)) if valid_conformers[i]]
                )
            y_true_train[tgt] = y_true[mask]
            model.fit(train_features[mask], y_true[mask])
            y_pred_train[tgt] = model.predict(train_features[mask])
        if args.challenge == "antiviral-admet-2025":
            results_dict[feat][model_name] = eval_admet(y_true_train, y_pred_train)
        elif args.challenge == "antiviral-potency-2025":
            results_dict[feat][model_name] = eval_potency(y_true_train, y_pred_train)

    with open(f"{save_dir}/{feat}_results.pkl", "wb") as f:
        pickle.dump(results_dict[feat], f)

    # get best aggregated model
    best_model = min(
        results_dict[feat],
        key=lambda x: results_dict[feat][x]["aggregated"]["macro_mean_absolute_error"],
    )
    print(f"Best model for {feat}: {best_model}")
    print(
        f"Best model MAE: {results_dict[feat][best_model]['aggregated']['macro_mean_absolute_error']}"
    )
    print(f"Results for {feat} saved to results/{feat}_results.pkl")

with open(f"{save_dir}/results_dict.pkl", "wb") as f:
    pickle.dump(results_dict, f)
