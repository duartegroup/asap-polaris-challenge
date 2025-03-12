conda activate asap-challenge

astra benchmark features/antiviral-admet-2025/LogD_cats3d.pkl --name LogD_cats3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_cats3d.pkl --name LogD_cats3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_desc2D.pkl --name LogD_desc2D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_desc2D.pkl --name LogD_desc2D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_desc3D.pkl --name LogD_desc3D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_desc3D.pkl --name LogD_desc3D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_electroshape.pkl --name LogD_electroshape_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_electroshape.pkl --name LogD_electroshape_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_pharm2d_cats.pkl --name LogD_pharm2d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_pharm2d_cats.pkl --name LogD_pharm2d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_pharm3d_cats.pkl --name LogD_pharm3d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_pharm3d_cats.pkl --name LogD_pharm3d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_pmapper2d.pkl --name LogD_pmapper2d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_pmapper2d.pkl --name LogD_pmapper2d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_pmapper3d.pkl --name LogD_pmapper3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_pmapper3d.pkl --name LogD_pmapper3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_rdkit.pkl --name LogD_rdkit_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_rdkit.pkl --name LogD_rdkit_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_usrcat.pkl --name LogD_usrcat_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_usrcat.pkl --name LogD_usrcat_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-admet-2025/LogD_usr.pkl --name LogD_usr_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-admet-2025/LogD_usr.pkl --name LogD_usr_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax
