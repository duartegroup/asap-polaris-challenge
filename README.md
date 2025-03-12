# Benchmarking ASTRA in the ASAP Discovery x OpenADMET Antiviral Challenge

This repository contains the code for our submission to the [ASAP Discovery x OpenADMET Antiviral Challenge](https://antiviral.polarishub.io). Further details can be found in our [report](https://docs.google.com/document/d/1464wiMCWdncfWoMIpL4WHI31qOECqeBq0CEhwiAAfW4/edit?usp=sharing).

Set up the conda environment:

```bash
conda env create -f env.yml
conda activate asap-challenge
```

Login to Polaris:

```bash
polaris login
```

Featurise the data:
```bash
python featurise_cmpds.py --challenge <challenge>
```

Benchmark on training data:
```bash
python benchmark_on_train.py --challenge <challenge>
```

Prepare the datasets:
```bash
python prepare_data.py --challenge <challenge>
```

Get ASTRA (not public yet):
```bash
git clone git@github.com:duartegroup/astra.git
cd astra
pip install -e .
```

Find the best model for each featurisation scheme using ASTRA: 
```bash
bash benchmark_HLM.sh
bash benchmark_KSOL.sh
bash benchmark_LogD.sh
bash benchmark_MDR1MDCKII.sh
bash benchmark_MERS.sh
bash benchmark_MLM.sh
bash benchmark_SARS.sh
```

Clean up the results:
```bash
mkdir results/HLM
mv results/HLM_* results/HLM
mkdir results/LogD
mv results/LogD_* results/LogD
mkdir results/MLM
mv results/MLM_* results/MLM
mkdir results/KSOL
mv results/KSOL_* results/KSOL
mkdir results/MDR1MDCKII
mv results/MDR1MDCKII_* results/MDR1MDCKII
mkdir results/pIC50_SARS_CoV_2_Mpro
mv results/pIC50_SARS_CoV_2_Mpro_* results/pIC50_SARS_CoV_2_Mpro
mkdir results/pIC50_MERS_CoV_Mpro
mv results/pIC50_MERS_CoV_Mpro_* results/pIC50_MERS_CoV_Mpro
```

Find the best featurisation scheme using ASTRA:
```bash
cd results/HLM
astra compare HLM_cats3d_minmax HLM_electroshape_minmax HLM_pharm3d_cats_minmax HLM_rdkit_minmax \
              HLM_cats3d_standard HLM_electroshape_standard HLM_pharm3d_cats_standard  HLM_rdkit_standard \
              HLM_desc2D_minmax HLM_pmapper2d_minmax HLM_usrcat_minmax \
              HLM_desc2D_standard HLM_pmapper2d_standard HLM_usrcat_standard \
              HLM_desc3D_minmax HLM_pharm2d_cats_minmax HLM_pmapper3d_minmax HLM_usr_minmax \
              HLM_desc3D_standard HLM_pharm2d_cats_standard HLM_pmapper3d_standard HLM_usr_standard \
              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --n_folds 5
cd ../KSOL
astra compare KSOL_cats3d_minmax KSOL_desc3D_standard KSOL_pharm2d_cats_minmax KSOL_pmapper2d_standard \
              KSOL_usrcat_minmax KSOL_cats3d_standard KSOL_electroshape_minmax KSOL_pharm2d_cats_standard \
              KSOL_pmapper3d_minmax KSOL_usrcat_standard KSOL_desc2D_minmax KSOL_electroshape_standard \
              KSOL_pharm3d_cats_minmax KSOL_pmapper3d_standard KSOL_usr_minmax KSOL_desc2D_standard \
              KSOL_pharm3d_cats_standard KSOL_rdkit_minmax KSOL_usr_standard KSOL_desc3D_minmax \
              KSOL_pmapper2d_minmax KSOL_rdkit_standard \
              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --n_folds 5
cd ../LogD
astra compare LogD_cats3d_minmax LogD_desc3D_standard LogD_pharm2d_cats_minmax LogD_pmapper2d_standard \
              LogD_usrcat_minmax LogD_cats3d_standard LogD_electroshape_minmax LogD_pharm2d_cats_standard \
              LogD_pmapper3d_minmax LogD_usrcat_standard LogD_desc2D_minmax LogD_electroshape_standard \
              LogD_pharm3d_cats_minmax LogD_pmapper3d_standard LogD_usr_minmax LogD_desc2D_standard \
              LogD_pharm3d_cats_standard LogD_rdkit_minmax LogD_usr_standard LogD_desc3D_minmax \
              LogD_pmapper2d_minmax LogD_rdkit_standard \
              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --n_folds 5
cd ../MDR1MDCKII
astra compare MDR1MDCKII_cats3d_minmax MDR1MDCKII_desc3D_standard MDR1MDCKII_pharm2d_cats_minmax MDR1MDCKII_pmapper2d_standard \
              MDR1MDCKII_usrcat_minmax MDR1MDCKII_cats3d_standard MDR1MDCKII_electroshape_minmax MDR1MDCKII_pharm2d_cats_standard \
              MDR1MDCKII_pmapper3d_minmax MDR1MDCKII_usrcat_standard MDR1MDCKII_desc2D_minmax MDR1MDCKII_electroshape_standard \
              MDR1MDCKII_pharm3d_cats_minmax MDR1MDCKII_pmapper3d_standard MDR1MDCKII_usr_minmax MDR1MDCKII_desc2D_standard \
              MDR1MDCKII_pharm3d_cats_standard MDR1MDCKII_rdkit_minmax MDR1MDCKII_usr_standard MDR1MDCKII_desc3D_minmax \
              MDR1MDCKII_pmapper2d_minmax MDR1MDCKII_rdkit_standard \
              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --n_folds 5
cd ../MLM
astra compare MLM_cats3d_minmax MLM_desc3D_standard MLM_pharm2d_cats_minmax MLM_pmapper2d_standard \
              MLM_usrcat_minmax MLM_cats3d_standard MLM_electroshape_minmax MLM_pharm2d_cats_standard \
              MLM_pmapper3d_minmax MLM_usrcat_standard MLM_desc2D_minmax MLM_electroshape_standard \
              MLM_pharm3d_cats_minmax MLM_pmapper3d_standard MLM_usr_minmax MLM_desc2D_standard \
              MLM_pharm3d_cats_standard MLM_rdkit_minmax MLM_usr_standard MLM_desc3D_minmax \
              MLM_pmapper2d_minmax MLM_rdkit_standard \
              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --n_folds 5
cd ../pIC50_MERS_CoV_Mpro
astra compare pIC50_MERS_CoV_Mpro_desc2D_minmax pIC50_MERS_CoV_Mpro_rdkit_minmax \
              pIC50_MERS_CoV_Mpro_desc2D_standard pIC50_MERS_CoV_Mpro_rdkit_standard \
              pIC50_MERS_CoV_Mpro_desc3D_minmax pIC50_MERS_CoV_Mpro_pharm3d_cats_minmax pIC50_MERS_CoV_Mpro_usrcat_minmax \
              pIC50_MERS_CoV_Mpro_desc3D_standard pIC50_MERS_CoV_Mpro_pharm3d_cats_standard pIC50_MERS_CoV_Mpro_usrcat_standard \
              pIC50_MERS_CoV_Mpro_electroshape_minmax pIC50_MERS_CoV_Mpro_pmapper3d_minmax pIC50_MERS_CoV_Mpro_usr_minmax \
              pIC50_MERS_CoV_Mpro_electroshape_standard pIC50_MERS_CoV_Mpro_pmapper3d_standard pIC50_MERS_CoV_Mpro_usr_standard \
              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --n_folds 5
cd ../pIC50_SARS_CoV_2_Mpro
astra compare pIC50_SARS_CoV_2_Mpro_desc2D_minmax pIC50_SARS_CoV_2_Mpro_rdkit_minmax \
              pIC50_SARS_CoV_2_Mpro_desc2D_standard pIC50_SARS_CoV_2_Mpro_rdkit_standard \
              pIC50_SARS_CoV_2_Mpro_desc3D_minmax pIC50_SARS_CoV_2_Mpro_pharm3d_cats_minmax pIC50_SARS_CoV_2_Mpro_usrcat_minmax \
              pIC50_SARS_CoV_2_Mpro_desc3D_standard pIC50_SARS_CoV_2_Mpro_pharm3d_cats_standard pIC50_SARS_CoV_2_Mpro_usrcat_standard \
              pIC50_SARS_CoV_2_Mpro_electroshape_minmax pIC50_SARS_CoV_2_Mpro_pmapper3d_minmax pIC50_SARS_CoV_2_Mpro_usr_minmax \
              pIC50_SARS_CoV_2_Mpro_electroshape_standard pIC50_SARS_CoV_2_Mpro_pmapper3d_standard pIC50_SARS_CoV_2_Mpro_usr_standard \
              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --n_folds 5
cd ../..
```

During the course of the competition, the organisers decided to log-transform the data using log10(x + 1) rather than clipping all values to an epsilon of 1e-8 before log-transforming, so the final models were trained using log10(x + 1)-transformed data:

```bash
python prepare_data_final.py --challenge <challenge>
```

Training the final models, and submitting predictions was done in [final_models.ipynb](final_models.ipynb).

(`challenge` can be `antiviral-admet-2025` or `antiviral-potency-2025`.)

# Acknowledgements
We would like to thank the organisers of the challenge, and all developers of the open-source tools that ASTRA is built upon. We plan to share further details of our methodology and results, including all code, in a preprint soon. We look forward to discussing with the community.
