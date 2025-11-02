# extreme-H distribution
[repository] A general class of continuous asymmetric distributions with positive support

## Contents

### [202510](./202510)
This folder contains source code artifacts presented by the authors to the _reply round of October 2025_.

Contents are split in folders according to the programming language:
- [R](./202510/paper_results/eval_notebook_R.ipynb): provides R notebook to produce **Figure 5** (`Randomized Quantile Residuals`) and **Figure 6** (`Histograms and fitted pdfs`).
- [python](./202510/tutorial_H_allinone_jackknife.ipynb): provides Python notebook which implemented utility functions to allow for experiments with the extreme-H distribution.
  - notebook generates **Table 3** (estimated parameters and information criteria).
  - notebook provide use cases for `def estimate_extremeH(samples, particular_model_from_table1=4, initial_guess=[])` function:
    - `samples` is a list of samples;
    - `particular_model_from_table1` is a tentative particular model:
        - `1` is Frechet, `2` is Weibull, `3` is Gamma and `4` is Half-normal. A tentative model is a requirement to the parameter estimation process.
    - `initial_guess` is an optional parameter to skip **Algorithm 1** when estimating the distribution parameters. It is used for the Gamma distribution;
    - the function returns the estimated `optimal_params_llf` parameters found by **Algorithm 2** and metrics (`aic, aicc, bic, edc, logLik`).
  - notebook provide use cases for `def eval_estimated_extremeH(samples, optimal_params, particular_model_from_table1=4, initial_guess=[])` function:
    - `samples` is a list of samples;
    - `optimal_params` is the n-tuple to be evaluated in a parametric bootstrap based goodness-of-fit test (KS and CVM)
    - `particular_model_from_table1` is a tentative particular model:
        - `1` is Frechet, `2` is Weibull, `3` is Gamma and `4` is Half-normal. A tentative model is a requirement to the parameter estimation process.
    - `initial_guess` is an optional parameter to skip **Algorithm 1** when estimating the distribution parameters. Should be defined due to non-identifiability isses ;
    - the function returns KS and CVM p-values.

### [202503](./202503)
This folder contains source code artifacts presented by the authors to the _reply round of March 2025_.

Contents are split in folders according to the programming language:
- [R](./202503/R): provides R scripts to produce **Figure 5** (`Randomized Quantile Residuals`) and **Figure 6** (`Histograms and fitted pdfs`).
- [python](./202503/python): provides Python notebooks which implemented utility functions to allow for experiments with the extreme-H distribution.
  - [modelling](./202503/python/modelling_H.ipynb): notebook generates **Table 3** (estimated parameters and information criteria).
  - [fitting](./202503/python/fitting_H_hyperopt.ipynb): the parameters estimation for the _Gamma distribution_ required an better starting point in the MLE process. So, this notebook departed from the particular case (as defined in **Table 1**) and used it as an initial guess to a multi-parametric optimization process using the `hyperopt` Python package. This process depends on random data (from `hyperopt`) and may generate multiple candidates. For the reply round of March 2025, we got the n-tuple `[np.float64(0.0014600180926046908), np.float64(7.168558250732656), np.float64(-6.554152619274005), np.float64(0.0017861406540565223), np.float64(8.57484235581811), np.float64(-0.29244892768030395)]` for the Gamma distribution which was optimal in the LS-sense (**Algorithm 1**) by comparing ECDF and CDF. This n-tuple was input to the MLE process (**Algorithm 2**) to get an optimal n-tuple in the MLE sense.
  


