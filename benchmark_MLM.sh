conda activate asap-challenge

astra benchmark features/antiviral-admet-2025/MLM_cats3d.pkl --name MLM_cats3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_cats3d.pkl --name MLM_cats3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_desc2D.pkl --name MLM_desc2D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_desc2D.pkl --name MLM_desc2D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_desc3D.pkl --name MLM_desc3D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_desc3D.pkl --name MLM_desc3D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_electroshape.pkl --name MLM_electroshape_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_electroshape.pkl --name MLM_electroshape_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_pharm2d_cats.pkl --name MLM_pharm2d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_pharm2d_cats.pkl --name MLM_pharm2d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_pharm3d_cats.pkl --name MLM_pharm3d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_pharm3d_cats.pkl --name MLM_pharm3d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_pmapper2d.pkl --name MLM_pmapper2d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_pmapper2d.pkl --name MLM_pmapper2d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_pmapper3d.pkl --name MLM_pmapper3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_pmapper3d.pkl --name MLM_pmapper3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_rdkit.pkl --name MLM_rdkit_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_rdkit.pkl --name MLM_rdkit_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_usrcat.pkl --name MLM_usrcat_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_usrcat.pkl --name MLM_usrcat_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/MLM_usr.pkl --name MLM_usr_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/MLM_usr.pkl --name MLM_usr_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax
