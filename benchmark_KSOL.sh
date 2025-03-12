conda activate asap-challenge

astra benchmark features/antiviral-admet-2025/KSOL_cats3d.pkl --name KSOL_cats3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_cats3d.pkl --name KSOL_cats3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_desc2D.pkl --name KSOL_desc2D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_desc2D.pkl --name KSOL_desc2D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_desc3D.pkl --name KSOL_desc3D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_desc3D.pkl --name KSOL_desc3D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_electroshape.pkl --name KSOL_electroshape_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_electroshape.pkl --name KSOL_electroshape_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_pharm2d_cats.pkl --name KSOL_pharm2d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_pharm2d_cats.pkl --name KSOL_pharm2d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_pharm3d_cats.pkl --name KSOL_pharm3d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_pharm3d_cats.pkl --name KSOL_pharm3d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_pmapper2d.pkl --name KSOL_pmapper2d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_pmapper2d.pkl --name KSOL_pmapper2d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_pmapper3d.pkl --name KSOL_pmapper3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_pmapper3d.pkl --name KSOL_pmapper3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_rdkit.pkl --name KSOL_rdkit_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_rdkit.pkl --name KSOL_rdkit_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_usrcat.pkl --name KSOL_usrcat_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_usrcat.pkl --name KSOL_usrcat_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/KSOL_usr.pkl --name KSOL_usr_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/KSOL_usr.pkl --name KSOL_usr_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax
