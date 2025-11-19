# Nickell Bias in Panel Local Projection

## Motivation
Panel local projections with country fixed effects have become the standard tool for measuring how financial crises affect output. The approach regresses $y_{i,t+h}$ on crisis indicators $x_{i,t}$ and absorbs unit heterogeneity with $\text{FE}$. The paper shows that, even when $x_{i,t}$ does not contain lagged $y_{i,t}$, the dynamic structure inherent in predictive specifications makes the fixed-effects estimator suffer from the Nickell bias. Incorrectly assuming strict exogeneity leads researchers to understate crisis-driven output losses and to rely on $t$-tests whose nominal sizes no longer match the true rejection probabilities.

## Intrinsic Nickell Bias
The authors study a panel VAR(1) prototype in which $y_{i,t+1} = \mu_i^{(0)y} + \beta^{(0)} x_{i,t+1} + u_{i,t+1}^y$ and $x_{i,t+1} = \mu_i^x + \rho x_{i,t} + u_{i,t+1}^x$. Iterating the system implies $y_{i,t+h}$ depends on current and lagged innovations in $x_{i,t}$, so the composite error $e_{i,t+h}^{(h)}$ is only weakly exogenous: $\mathbb{E}[e_{i,t+h}^{(h)} \mid \mathbf{x}_i^T] \neq 0$ whenever $\beta^{(0)} \neq 0$. Proposition 1 derives the analytic bias of $\hat{\beta}^{(h)\mathrm{fe}}$:
\[
\hat{\beta}^{(h)\mathrm{fe}} \stackrel{a}{\sim} \beta^{(h)} - \frac{\beta^{(0)}\sigma_{u_x}^2}{T_h s_x^2} f_{T,h}(\rho) + \frac{\mathcal{Z}}{\sqrt{N T_h}},
\]
so the bias is order $1/T$ and does not vanish in the joint limit with $N/T \to c$. Positive persistence ($\rho>0$) yields attenuation ($\hat{\beta}^{(h)\mathrm{fe}}$ is biased toward zero), the distortion enlarges with the horizon $h$ and with more persistent crisis indicators, and $t$-statistics remain shifted even with known asymptotic variances.

## Split-Panel Jackknife Remedy
To remove the leading bias, the paper recommends the split-panel jackknife (SPJ):
\[
\hat{\beta}^{(h)\mathrm{spj}} = 2 \hat{\beta}^{(h)\mathrm{fe}} - \frac{\hat{\beta}^{(h)\mathrm{fe}}_a + \hat{\beta}^{(h)\mathrm{fe}}_b}{2},
\]
where the subscripts $a$ and $b$ denote FE estimates from the first and second halves of the panel. Under standard law-of-large-numbers and CLT conditions with $N/T^3 \to 0$, Theorem 1 shows $\sqrt{N T_h}(\hat{\beta}^{(h)\mathrm{spj}} - \beta^{(h)}) \Rightarrow \mathcal{N}(0, \mathbf{Q}^{-1} \mathbf{R} \mathbf{Q}^{-1})$, so SPJ is asymptotically unbiased and delivers valid Wald tests. The estimator preserves the appeal of LPs�researchers still specify only the predictive regression, can add controls $\mathbf{W}_{i,t}$, and do not need to model the full VAR for $\mathbf{x}_{i,t}$. Practically, the authors recommend SPJ for panels with $T \ge 30$ and $N/T \le 10$.

## Empirical Implications
Revisiting four influential cross-country crisis studies, the SPJ-based impulse responses exhibit larger and more persistent output losses than those implied by FE. Hence, the conventional fixed-effects LP systematically understates how severe and long-lasting financial crises are, and empirical work on crisis costs should replace FE estimates with SPJ-adjusted responses or other Nickell-robust procedures.
