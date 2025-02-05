print('file: D1-LSartificalData.R')
# generate & plot artificial data
beta0 = 8; beta = -1.2 # true intercept & slope
sigma = 1              # true standard deviation of normal noise
# ----------- generate data (begin)
set.seed(1953)                       # set seed for random number generators
x = seq(1,5,0.25); Lx = length(x)    # non-stochastic (uncertainty = 0)
Lr = 10                              # number of data for each x-value ('replicates')
se = sigma/sqrt(Lr); print(c(round(se,4),'standard error'))
y = matrix(data=NA,nrow=Lx,ncol=Lr)  # Lx x Lr = 17 x 10 matrix
for(k in 1:Lx) y[k,] = beta0+beta*x[k]+sigma*rnorm(Lr) # additive normal noise
# ----------- generate data (end)
# png('SLFartificalData220308.png',width=16,height=12,units='cm',res=300)
plot(x,y[,1],type='p',lwd=4,col='black',cex=0.3,ylim=c(0,10),     # plot 1. sample
       xlim=c(0,max(x)),xlab='x',ylab='y',las=1,cex.lab=1.5)
for(k in 2:Lr) points(x,y[,k],lwd=4,col='black',cex=0.3)          # plot replicates
# dev.off()
# [1] "file: R_LSartificalData.R"
# [1] "0.3162"         "standard error"
# png('SLFdata160923.png',width=16,height=12,units='cm',res=300)