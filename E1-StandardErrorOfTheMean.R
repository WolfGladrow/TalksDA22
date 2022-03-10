print('file: E1-StandardErrorOfTheMean.R')
# Standard Error Of The Mean
mu = 0; sigma = 1
dx= 0.01; x = seq(-4,4,dx); f1 = dnorm(x,mu,sigma) # population from which we sample
n = 10 # sample size
SE = sigma/sqrt(n)
f2 = dnorm(x,mu,SE) # distribution of the mean
# png('SE10n220310.png',width=16,height=12,units='cm',res=300)
plot(x,f1,type='l',lwd=2,col='black',xlab='x',ylab='PDFs',las=1,cex.lab=1.5,xlim=c(-3,3),ylim=c(0,max(f2)),lty=4)
lines(x,f2,col='blue',lwd=4)
legend('topleft',legend=c('standard normal PDF','PDF of mean (n=10)'),col=c('black','blue'),lty=c(4,1),lwd=c(2,4))
# dev.off()