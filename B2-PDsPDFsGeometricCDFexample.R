print('file: B2-PDsPDFsGeometricCDFexample.R')
# geometric CDF
h = 0.3        # probability of success in a single trial
k = seq(1,10,0.01)  # number of trials until first success
CDFgeo = pgeom(k-1,h)
# dgeom(x, prob, log = FALSE)
# x  vector of quantiles representing the number of failures in a sequence 
#    of Bernoulli trials before success occurs.
# Remark: number of failures before success = k-1 where 
#         k = number of trials until first success
# png('GeometricCDF170214.png',width=16,height=16,units='cm',res=300)
plot(k,CDFgeo,type='l',lwd=3,col='black',xlab='Number of trials, k, until first success',
     ylab='CDF',las=1,cex=0.4,ylim=c(0,1),cex.lab=1.5)
abline(h=1,col='green',lty=4)
text(5,0.3,bquote(~h == .(h)),col='black',cex=1.5,pos=4)
# dev.off()