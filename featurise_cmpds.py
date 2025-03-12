import polaris as po
import datamol as dm
from molfeat.trans import MoleculeTransformer
from molfeat.trans.fp import FPVecTransformer
from molfeat.calc.pharmacophore import Pharmacophore2D, Pharmacophore3D
import numpy as np
import pickle
import os
import argparse


def prep_mol(smiles: str) -> dm.Mol:
    """
    Create a datamol Mol object from a SMILES string and apply some preprocessing steps.

    Parameters
    ----------
    smiles : str
        A SMILES string.

    Returns
    -------
    dm.Mol
        A datamol Mol object.
    """
    mol = dm.to_mol(smiles)
    mol = dm.fix_mol(mol)
    mol = dm.sanitize_mol(mol)
    mol = dm.standardize_mol(mol)
    return mol


def featurise(
    transformer: MoleculeTransformer, train: list[dm.Mol], test: list[dm.Mol], desc: str
) -> None:
    """
    Featurise a list of molecules using a MoleculeTransformer object and save the features to disk.

    Parameters
    ----------
    transformer : MoleculeTransformer
        A MoleculeTransformer object for generating features.
    train : list[dm.Mol]
        A list of datamol Mol objects. Training set.
    test : list[dm.Mol]
        A list of datamol Mol objects. Test set.
    desc : str
        A description of the features being generated.
    """
    train_features = transformer(train)
    test_features = transformer(test)
    np.save(f"{save_dir}/{desc}_train.npy", train_features)
    np.save(f"{save_dir}/{desc}_test.npy", test_features)


parser = argparse.ArgumentParser()
parser.add_argument(
    "--challenge",
    type=str,
    default="antiviral-admet-2025",
)
args = parser.parse_args()

# Load data
competition = po.load_competition(f"asap-discovery/{args.challenge}")
competition.cache()
train, test = competition.get_train_test_split()

# Create a directory to save the features
save_dir = f"features/{args.challenge}"
os.makedirs(save_dir, exist_ok=True)

# Save SMILES strings
train_smiles = [smi for smi in train.X]
test_smiles = [smi for smi in test.X]
with open(f"{save_dir}/train_smiles.pkl", "wb") as f:
    pickle.dump(train_smiles, f)
with open(f"{save_dir}/test_smiles.pkl", "wb") as f:
    pickle.dump(test_smiles, f)

# Save Molecule objects
train_mols = [prep_mol(smi) for smi in train.X]
test_mols = [prep_mol(smi) for smi in test.X]
with open(f"{save_dir}/train_mols.pkl", "wb") as f:
    pickle.dump(train_mols, f)
with open(f"{save_dir}/test_mols.pkl", "wb") as f:
    pickle.dump(test_mols, f)

# Generate 2D features
mol_transformer_descs = ["cats2d", "pharm2d_cats", "pmapper2d"]
for desc in mol_transformer_descs:
    if desc == "pharm2d_cats":
        pharmacophore_gen = Pharmacophore2D(factory="cats")
        transformer = MoleculeTransformer(
            featurizer=pharmacophore_gen, dtype=float, n_jobs=4
        )
    elif desc == "pmapper2d":
        pharmacophore_gen = Pharmacophore2D(factory="pmapper")
        transformer = MoleculeTransformer(
            featurizer=pharmacophore_gen, dtype=float, n_jobs=4
        )
    else:
        transformer = MoleculeTransformer(featurizer=desc, dtype=float, n_jobs=4)
    featurise(transformer, train_mols, test_mols, desc)

# Generate 2D fingerprints
fp_vec_descs = ["desc2D", "estate", "rdkit", "fcfp", "ecfp"]
for desc in fp_vec_descs:
    transformer = FPVecTransformer(kind=desc, dtype=float, n_jobs=4)
    featurise(transformer, train_mols, test_mols, desc)

# Generate conformers
train_conformers = [
    dm.conformers.generate(
        mol, num_threads=4, minimize_energy=True, ignore_failure=True
    )
    for mol in train_mols
]
fails = sum([c is None for c in train_conformers])
print("TRAIN: Conformer generation failed for:", fails, "molecules")
with open(f"{save_dir}/train_conformers.pkl", "wb") as f:
    pickle.dump(train_conformers, f)
train_conformers = [c for c in train_conformers if c is not None]

test_conformers = [
    dm.conformers.generate(
        mol, num_threads=4, minimize_energy=True, ignore_failure=True
    )
    for mol in test_mols
]
fails = sum([c is None for c in test_conformers])
print("TEST: Conformer generation failed for:", fails, "molecules")
with open(f"{save_dir}/test_conformers.pkl", "wb") as f:
    pickle.dump(test_conformers, f)
test_conformers = [c for c in test_conformers if c is not None]

# Generate 3D features
mol_transformer_3d_descs = ["cats3d", "pharm3d_cats", "pmapper3d"]
for conformer_desc in mol_transformer_3d_descs:
    if conformer_desc == "pharm3d_cats":
        pharmacophore_gen = Pharmacophore3D(factory="cats")
        transformer = MoleculeTransformer(
            featurizer=pharmacophore_gen, dtype=float, n_jobs=4
        )
    elif conformer_desc == "pmapper3d":
        pharmacophore_gen = Pharmacophore3D(factory="pmapper")
        transformer = MoleculeTransformer(
            featurizer=pharmacophore_gen, dtype=float, n_jobs=4
        )
    else:
        transformer = MoleculeTransformer(
            featurizer=conformer_desc, dtype=float, n_jobs=4
        )
    featurise(transformer, train_conformers, test_conformers, conformer_desc)

# Generate 3D fingerprints
fp_vec_conformer_descs = ["desc3D", "electroshape", "usrcat", "usr"]
for conformer_desc in fp_vec_conformer_descs:
    transformer = FPVecTransformer(kind=conformer_desc, dtype=float, n_jobs=4)
    featurise(transformer, train_conformers, test_conformers, conformer_desc)
