# extreme-H distribution
[repository] A general class of continuous asymmetric distributions with positive support

## Contents

### [202503](202503)
This folder contains source code artifacts presented by the authors to the _reply round of March 2025_.

Contents are split in two folders according to the used programming language:
- [R](2025/R): provides R scripts to produce `Randomized Quantile Residuals` as included in **Figures 5** and **6**.
- [python](2025/python): provides Python notebooks which implemented utility functions to allow for experiments with the extreme-H distribution.
  - [modelling](202503/python/modelling_H.ipynb): notebook generates **Table 3** estimated parameters and information criteria.
  - [fitting](202503/python/fitting_H_hyperopt.ipynb): the Gamma distribution estimated values required an better starting point for the MLE process. So, this notebook departed from the particular case (as defined in **Table 1**) and used it as an initial guess to a multi-parametric optimization process using the `hyperopt` Python package. This process depends on random data (from `hyperopt`) and may generate multiple candidates. For the reply round of March 2025, we got the n-tuple `[np.float64(0.0014600180926046908), np.float64(7.168558250732656), np.float64(-6.554152619274005), np.float64(0.0017861406540565223), np.float64(8.57484235581811), np.float64(-0.29244892768030395)]` for the Gamma distribution which was optimal in the LS-sense (**Algorithm 1**) by comparing ECDF and CDF.
  


