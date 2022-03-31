print('file: B2-PDsPDFsGeometricPDexample.R')
# geometric PD
h = 0.3        # probability of success in single trial
k = seq(1,10)  # number of trials until first success
pgeo = dgeom(k-1,h)
# dgeom(x, prob, log = FALSE)
# x  vector of quantiles representing the number of failures in a sequence 
#    of Bernoulli trials before success occurs.
# Remark: number of failures before success = k-1 where 
#         k = number of trials until first success
# png('GeometricPD170214.png',width=16,height=16,units='cm',res=300)
plot(k,pgeo,type='p',lwd=4,col='black',xlab='Number of trials k until first success',
     ylab='Probability',las=1,cex=0.6,ylim=c(0,max(pgeo)),cex.lab=1.5)
abline(h=0,col='green',lty=4)
text(5,0.27,bquote(~h == .(h)),col='black',cex=1.5,pos=4)
# dev.off()