conda activate asap-challenge

astra benchmark features/antiviral-admet-2025/HLM_cats3d.pkl --name HLM_cats3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_cats3d.pkl --name HLM_cats3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_desc2D.pkl --name HLM_desc2D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_desc2D.pkl --name HLM_desc2D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_desc3D.pkl --name HLM_desc3D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_desc3D.pkl --name HLM_desc3D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_electroshape.pkl --name HLM_electroshape_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_electroshape.pkl --name HLM_electroshape_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_pharm2d_cats.pkl --name HLM_pharm2d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_pharm2d_cats.pkl --name HLM_pharm2d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_pharm3d_cats.pkl --name HLM_pharm3d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_pharm3d_cats.pkl --name HLM_pharm3d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_pmapper2d.pkl --name HLM_pmapper2d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_pmapper2d.pkl --name HLM_pmapper2d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_pmapper3d.pkl --name HLM_pmapper3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_pmapper3d.pkl --name HLM_pmapper3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_rdkit.pkl --name HLM_rdkit_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_rdkit.pkl --name HLM_rdkit_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_usrcat.pkl --name HLM_usrcat_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_usrcat.pkl --name HLM_usrcat_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/HLM_usr.pkl --name HLM_usr_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/HLM_usr.pkl --name HLM_usr_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax
