conda activate asap-challenge

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_desc2D.pkl --name pIC50_MERS_CoV_Mpro_desc2D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_desc2D.pkl --name pIC50_MERS_CoV_Mpro_desc2D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_desc3D.pkl --name pIC50_MERS_CoV_Mpro_desc3D_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_desc3D.pkl --name pIC50_MERS_CoV_Mpro_desc3D_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_electroshape.pkl --name pIC50_MERS_CoV_Mpro_electroshape_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_electroshape.pkl --name pIC50_MERS_CoV_Mpro_electroshape_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_pharm3d_cats.pkl --name pIC50_MERS_CoV_Mpro_pharm3d_cats_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_pharm3d_cats.pkl --name pIC50_MERS_CoV_Mpro_pharm3d_cats_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_pmapper3d.pkl --name pIC50_MERS_CoV_Mpro_pmapper3d_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_pmapper3d.pkl --name pIC50_MERS_CoV_Mpro_pmapper3d_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_rdkit.pkl --name pIC50_MERS_CoV_Mpro_rdkit_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_rdkit.pkl --name pIC50_MERS_CoV_Mpro_rdkit_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_usrcat.pkl --name pIC50_MERS_CoV_Mpro_usrcat_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_usrcat.pkl --name pIC50_MERS_CoV_Mpro_usrcat_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_usr.pkl --name pIC50_MERS_CoV_Mpro_usr_standard \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler Standard

astra benchmark features/antiviral-potency-2025/pIC50_MERS_CoV_Mpro_usr.pkl --name pIC50_MERS_CoV_Mpro_usr_minmax \
                                              --run_nested_CV --n_jobs 8 \
                                              --main_metric MAE --sec_metrics MSE R2 SpearmanR KendallTau PearsonR --scaler MinMax

