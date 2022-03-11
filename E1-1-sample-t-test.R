print('file: E1-1-sample-t-test.R')
# How to apply 1-sample-t-test in R and how to interpret results?
x = c(1.5,0.3,1.8,-1.4,0.8,3.0,-0.3,0.2,-0.4,1.9,0.0,0.3,-1.0,
      1.2,3.8,0.5,-0.8,2.0,1.1,1.2,-0.4,2.7,0.5,-1.4,1.1)
T0 = 0   # hypothesized temperature of null hypothesis H0
# --------------------------------------------------------------
print(' ---------------------------------------------------')
print('(1) Null Hypothesis Significance Testing (NHST)')
# H0: sample stems from a normal distribution with true mean mu = 0 
out1 = t.test(x)
# One Sample t-test
# 
# data:  x
# t = 2.7128, df = 24, p-value = 0.01215
# alternative hypothesis: true mean is not equal to 0
# 95 percent confidence interval:
#   0.1741312 1.2818688
# sample estimates:
#   mean of x 
# 0.728 
alpha = 0.05; print(c(alpha,'alpha'))   # chosen level of significance; usually, however, not necessarily 0.05
p = out1$p.value         # p-value
p = t.test(x)$p.value    # p-value 
print(c(round(p,4),'p-value'))
if (p < alpha) print('reject H0 because p < alpha')
if (p >= alpha) print('do not reject H0 because p >= alpha')
# --------------------------------------------------------------
print(' ---------------------------------------------------')
print('(2) Bayesian t-test')
# H0: sample stems from a normal distribution with true mean mu = 0
# H1: sample stems from a normal distribution with true mean mu net equal to 0
# install.packages('BayesFactor')
library(BayesFactor)
out2 = ttestBF(x,rscale=1)
BF = extractBF(out2,onlybf = TRUE); print(c(round(BF,4),'Bayes factor BF'))
# Jeffreys' scales of evidence (slighltly modified):
# LowBF = 1/sqrt(10); print(c(round(LowBF,3),'LowBF'))   # 0.316
# HighBF = sqrt(10); print(c(round(HighBF,2),'HighBF'))  # 3.16
if(BF > 10)                    print('strong evidence against H0/strong evidence for H1')
if((BF >= 3.16) && (BF <= 10)) print('substantial evidence against H0/substantial evidence for H1')
if((BF > 1) && (BF < 3.16))    print('slight evidence against H0/slight evidence for H1')
if((BF >= 0.316) && (BF <= 1)) print('slight evidence against H1/slight evidence for H0')
if((BF > 0.1) && (BF < 0.316)) print('substantial evidence against H1/substantial evidence for H0')
if(BF <= 0.1)                  print('strong evidence against H1/strong evidence for H0')
# ---------------------------------------------------------------------------------------------
# ----------------------------------------------------------------
# Remarks:
# ttestBF()   Bayesian-t-test
# ttestBF(x = NULL, y = NULL, formula = NULL, mu = 0,
#    nullInterval = NULL, paired = FALSE, data = NULL, rscale = 'medium',
#    posterior = FALSE, callback = function(...) as.integer(0), ...)
# When hypothesized mean (T0) is not equal 0, set mu to the hypothesized mean (for example: T0=0.5):
#   ttestBF(x,rscale=1,mu=0.5) 
# ttestBF(x,y,rscale=1)    2-sample-Bayesian-t-test (try with y-sample from standard normal PDF: y = rnorm(20))
#   
# extractBF(out2,onlybf = TRUE)    The output of ttestBF() comes in a 'strange' format and thus the routine extractBF()
#                                  is required in order to obtain the Bayes factor
# ----------------------------------------------------------------