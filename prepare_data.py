import polaris as po
import numpy as np
import pandas as pd
import pickle
import splito
import argparse


def split_dataset(smiles: list[str]) -> list[int]:
    """
    Split a dataset into 5 folds using the MaxDissimilaritySplit splitter from splito.

    Parameters
    ----------
    smiles : list[str]
        A list of SMILES strings.

    Returns
    -------
    list[int]
        A list of integers representing the fold number for each SMILES string.
    """
    # Set aside 20% of the data for the first fold, keep the rest for the next steps
    splitter = splito.MaxDissimilaritySplit(n_jobs=4, test_size=0.2, random_state=42)
    train_idx, test_idx = next(splitter.split(X=smiles))
    fold1_4 = [smiles[i] for i in train_idx]
    fold0 = [smiles[i] for i in test_idx]

    # Set aside 25% of the remaining data for the second fold, keep the rest for the next steps
    splitter = splito.MaxDissimilaritySplit(n_jobs=4, test_size=0.25, random_state=42)
    train_idx, test_idx = next(splitter.split(X=fold1_4))
    fold2_4 = [fold1_4[i] for i in train_idx]
    fold1 = [fold1_4[i] for i in test_idx]

    # Set aside 34% of the remaining data for the third fold, keep the rest for the next steps
    splitter = splito.MaxDissimilaritySplit(n_jobs=4, test_size=0.34, random_state=42)
    train_idx, test_idx = next(splitter.split(X=fold2_4))
    fold3_4 = [fold2_4[i] for i in train_idx]
    fold2 = [fold2_4[i] for i in test_idx]

    # Split the remaining data into the last two folds
    splitter = splito.MaxDissimilaritySplit(n_jobs=4, test_size=0.5, random_state=42)
    train_idx, test_idx = next(splitter.split(X=fold3_4))
    fold3 = [fold3_4[i] for i in train_idx]
    fold4 = [fold3_4[i] for i in test_idx]

    # Assign fold numbers to each SMILES string
    indices = []
    for s in smiles:
        if s in fold0:
            indices.append(0)
        elif s in fold1:
            indices.append(1)
        elif s in fold2:
            indices.append(2)
        elif s in fold3:
            indices.append(3)
        elif s in fold4:
            indices.append(4)
    return indices


parser = argparse.ArgumentParser()
parser.add_argument("--challenge", type=str, default="antiviral-admet-2025")
args = parser.parse_args()

# Load data
competition = po.load_competition(f"asap-discovery/{args.challenge}")
competition.cache()
train, test = competition.get_train_test_split()

# Define features to create datasets for
if args.challenge == "antiviral-admet-2025":
    features = [
        "rdkit",
        "pharm2d_cats",
        "pharm3d_cats",
        "cats3d",
        "pmapper2d",
        "pmapper3d",
        "desc2D",
        "desc3D",
        "electroshape",
        "usrcat",
        "usr",
    ]
elif args.challenge == "antiviral-potency-2025":
    features = [
        "rdkit",
        "desc2D",
        "desc3D",
        "pmapper3d",
        "pharm3d_cats",
        "electroshape",
        "usrcat",
        "usr",
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

if args.challenge == "antiviral-admet-2025":  # ADMET endpoints
    targets = ["MDR1MDCKII", "HLM", "KSOL", "MLM", "LogD"]
    # Collect the raw data
    MDR1MDCKII, HLM, KSOL, MLM, LogD = [], [], [], [], []
    for datapoint in train:
        MDR1MDCKII.append(datapoint[1]["MDR1-MDCKII"])
        HLM.append(datapoint[1]["HLM"])
        KSOL.append(datapoint[1]["KSOL"])
        MLM.append(datapoint[1]["MLM"])
        LogD.append(datapoint[1]["LogD"])
elif args.challenge == "antiviral-potency-2025":  # Potency endpoints
    targets = ["pIC50_SARS_CoV_2_Mpro", "pIC50_MERS_CoV_Mpro"]
    # Collect the raw data
    pIC50_SARS_CoV_2_Mpro, pIC50_MERS_CoV_Mpro = [], []
    for datapoint in train:
        pIC50_SARS_CoV_2_Mpro.append(datapoint[1]["pIC50 (SARS-CoV-2 Mpro)"])
        pIC50_MERS_CoV_Mpro.append(datapoint[1]["pIC50 (MERS-CoV Mpro)"])

# Conformer generation failed for some train examples
# we will need to filter the corresponding data points later
with open(f"features/{args.challenge}/train_conformers.pkl", "rb") as f:
    train_conformers = pickle.load(f)
valid_conformers = [conf is not None for conf in train_conformers]

# SMILES strings
train_smiles = [datapoint[0] for datapoint in train]
train_smiles_3d = [
    train_smiles[i] for i in range(len(train_smiles)) if valid_conformers[i]
]

# for ASTRA, we need DataFrames containing a column 'Target' with the target values
# and a column 'Features' with the feature vectors, bring data into that format
epsilon = 1e-8  # to avoid log(0)
for target in targets:

    # drop data points for which conformer generation failed
    cleaned_target_3d = [
        locals()[target][i] for i in range(len(locals()[target])) if valid_conformers[i]
    ]
    cleaned_indices_3d = [
        i for i in range(len(locals()[target])) if valid_conformers[i]
    ]

    # drop nan values and keep track of the indices
    cleaned_target = [x for x in locals()[target] if str(x) != "nan"]
    cleaned_indices = [i for i, x in enumerate(locals()[target]) if str(x) != "nan"]
    cleaned_smiles = [train_smiles[i] for i in cleaned_indices]
    cleaned_target_3d = [
        cleaned_target_3d[i]
        for i in range(len(cleaned_target_3d))
        if str(cleaned_target_3d[i]) != "nan"
    ]
    cleaned_indices_3d = [
        i for i in range(len(cleaned_target_3d)) if str(cleaned_target_3d[i]) != "nan"
    ]
    cleaned_smiles_3d = [train_smiles_3d[i] for i in cleaned_indices_3d]

    # log10 transform data
    if target not in ["LogD", "pIC50_SARS_CoV_2_Mpro", "pIC50_MERS_CoV_Mpro"]:
        cleaned_target = np.log10(np.clip(cleaned_target, a_min=epsilon, a_max=None))
        cleaned_target_3d = np.log10(
            np.clip(cleaned_target_3d, a_min=epsilon, a_max=None)
        )

    # split the data into 5 folds
    indices = split_dataset(cleaned_smiles)
    indices_3d = split_dataset(cleaned_smiles_3d)

    for feature in features:
        feature_vectors = np.load(f"features/{args.challenge}/{feature}_train.npy")

        if (
            feature in features_3d
        ):  # drop data points for which conformer generation failed
            cleaned_feature_vectors = feature_vectors[cleaned_indices_3d]
            cleaned_feature_vectors = [fv for fv in cleaned_feature_vectors]
            feature_df = pd.DataFrame(
                {
                    "Target": cleaned_target_3d,
                    "Features": cleaned_feature_vectors,
                    "SMILES": cleaned_smiles_3d,
                    "Fold": indices_3d,
                }
            )
        else:
            cleaned_feature_vectors = feature_vectors[cleaned_indices]
            cleaned_feature_vectors = [fv for fv in cleaned_feature_vectors]
            feature_df = pd.DataFrame(
                {
                    "Target": cleaned_target,
                    "Features": cleaned_feature_vectors,
                    "SMILES": cleaned_smiles,
                    "Fold": indices,
                }
            )
        feature_df.to_pickle(f"features/{args.challenge}/{target}_{feature}.pkl")
