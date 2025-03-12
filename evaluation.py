from collections import defaultdict
from typing import Tuple
import numpy as np
from scipy.stats import kendalltau, pearsonr, spearmanr
from sklearn.metrics import mean_absolute_error, r2_score, mean_squared_error


def mask_nan(y_true, y_pred):
    mask = ~np.isnan(y_true)
    y_true = np.array(y_true)[mask]
    y_pred = np.array(y_pred)[mask]
    return y_true, y_pred


def eval_potency(
    preds: dict[str, list], refs: dict[str, list]
) -> Tuple[dict[str, float]]:
    """
    Eval pIC50 potency performance with MAE (already log10 transformed)

    Parameters
    ----------
    preds : dict[str, list]
        Dictionary of predicted pIC50 values for SARS-CoV-2 and MERS-CoV Mpro.
    refs : dict[str, list]
        Dictionary of reference pIC50 values for SARS-CoV-2 and MERS-CoV Mpro.

    Returns
    -------
    dict[str, float]
        Returns a dictonary of summary statistics
    """

    keys = {"pIC50 (SARS-CoV-2 Mpro)", "pIC50 (MERS-CoV Mpro)"}
    collect = defaultdict(dict)

    for k in keys:
        if k not in preds.keys() or k not in refs.keys():
            raise ValueError("required key not present")

        ref, pred = mask_nan(refs[k], preds[k])

        mae = mean_absolute_error(ref, pred)
        ktau = kendalltau(ref, pred)
        mse = mean_squared_error(ref, pred)
        pr = pearsonr(ref, pred)
        r2 = r2_score(ref, pred)
        sr = spearmanr(ref, pred)

        # subchallenge statistics
        collect[k]["mean_absolute_error"] = mae
        collect[k]["kendall_tau"] = ktau.statistic
        collect[k]["mean_squared_error"] = mse
        collect[k]["pearson_r"] = pr.statistic
        collect[k]["r2"] = r2
        collect[k]["spearman_r"] = sr.statistic

    # compute macro average MAE
    macro_mae = np.mean([collect[k]["mean_absolute_error"] for k in keys])
    collect["aggregated"]["macro_mean_absolute_error"] = macro_mae

    # compute macro average Kendall's tau
    macro_ktau = np.mean([collect[k]["kendall_tau"] for k in keys])
    collect["aggregated"]["macro_kendall_tau"] = macro_ktau

    # compute macro average MSE
    macro_mse = np.mean([collect[k]["mean_squared_error"] for k in keys])
    collect["aggregated"]["macro_mean_squared_error"] = macro_mse

    # compute macro average Pearson's r
    macro_pr = np.mean([collect[k]["pearson_r"] for k in keys])
    collect["aggregated"]["macro_pearson_r"] = macro_pr

    # compute macro average R2
    macro_r2 = np.mean([collect[k]["r2"] for k in keys])
    collect["aggregated"]["macro_r2"] = macro_r2

    # compute macro average Spearman's r
    macro_sr = np.mean([collect[k]["spearman_r"] for k in keys])
    collect["aggregated"]["macro_spearman_r"] = macro_sr

    return collect


def eval_admet(
    preds: dict[str, list], refs: dict[str, list]
) -> Tuple[dict[str, float]]:
    """
    Eval ADMET targets with MAE for pre-log10 transformed targets (LogD) and MALE  (MAE on log10 transformed dataset) on non-transformed data

    This provides a "relative" error metric that will not be as sensitive to the large outliers with huge errors. This is sometimes known as MALE.

    Parameters
    ----------
    preds : dict[str, list]
        Dictionary of predicted ADMET values.
    refs : dict[str, list]
        Dictionary of reference ADMET values.

    Returns
    -------
    dict[str, float]
        Returns a dictonary of summary statistics
    """
    keys = {
        "MLM",
        "HLM",
        "KSOL",
        "LogD",
        "MDR1-MDCKII",
    }
    # will be treated as is
    logscale_endpts = {"LogD"}

    collect = defaultdict(dict)

    for k in keys:
        if k not in preds.keys() or k not in refs.keys():
            raise ValueError("required key not present")

        ref, pred = mask_nan(refs[k], preds[k])

        if k in logscale_endpts:
            # already log10scaled
            mae = mean_absolute_error(ref, pred)
            ktau = kendalltau(ref, pred)
            mse = mean_squared_error(ref, pred)
            pr = pearsonr(ref, pred)
            r2 = r2_score(ref, pred)
            sr = spearmanr(ref, pred)
        else:
            # clip to a detection limit
            epsilon = 1e-8
            pred = np.clip(pred, a_min=epsilon, a_max=None)
            ref = np.clip(ref, a_min=epsilon, a_max=None)

            # transform both log10scale
            pred_log10s = np.log10(pred)
            ref_log10s = np.log10(ref)

            # compute MALE and R2 in log space
            mae = mean_absolute_error(ref_log10s, pred_log10s)
            ktau = kendalltau(ref_log10s, pred_log10s)
            mse = mean_squared_error(ref_log10s, pred_log10s)
            pr = pearsonr(ref_log10s, pred_log10s)
            r2 = r2_score(ref_log10s, pred_log10s)
            sr = spearmanr(ref_log10s, pred_log10s)

        collect[k]["mean_absolute_error"] = mae
        collect[k]["kendall_tau"] = ktau.statistic
        collect[k]["mean_squared_error"] = mse
        collect[k]["pearson_r"] = pr.statistic
        collect[k]["r2"] = r2
        collect[k]["spearman_r"] = sr.statistic

    # compute macro average MAE
    macro_mae = np.mean([collect[k]["mean_absolute_error"] for k in keys])
    collect["aggregated"]["macro_mean_absolute_error"] = macro_mae

    # compute macro average Kendall's tau
    macro_ktau = np.mean([collect[k]["kendall_tau"] for k in keys])
    collect["aggregated"]["macro_kendall_tau"] = macro_ktau

    # compute macro average MSE
    macro_mse = np.mean([collect[k]["mean_squared_error"] for k in keys])
    collect["aggregated"]["macro_mean_squared_error"] = macro_mse

    # compute macro average Pearson's r
    macro_pr = np.mean([collect[k]["pearson_r"] for k in keys])
    collect["aggregated"]["macro_pearson_r"] = macro_pr

    # compute macro average R2
    macro_r2 = np.mean([collect[k]["r2"] for k in keys])
    collect["aggregated"]["macro_r2"] = macro_r2

    # compute macro average Spearman's r
    macro_sr = np.mean([collect[k]["spearman_r"] for k in keys])
    collect["aggregated"]["macro_spearman_r"] = macro_sr

    return collect
