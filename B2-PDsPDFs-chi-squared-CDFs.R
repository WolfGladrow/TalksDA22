print('file: B2-PDsPDFs-chi-squared-CDFs.R')
# chi-squared CDF
x = seq(0.0,20,0.01)
nu3 = 3; nu5 = 5; nu10 = 10
chisq3 = pchisq(x,nu3); chisq5 = pchisq(x,nu5); chisq10 = pchisq(x,nu10)
# png('chi-squaredCDFBook160143R.png',width=16,height=12,units='cm',res=300)
plot(x,chisq3,type='l',col='blue',xlab='x',ylab='CDF',
     lwd=3,las=1,cex.lab=1.5)
lines(x,chisq5,col='red',lwd=3,lty=2)
lines(x,chisq10,col='black',lwd=3,lty=3)
text(3,0.9,bquote(~nu == .(nu3)),col='blue',cex=1.5)
text(6.3,0.5,bquote(~nu == .(nu5)),col='red',cex=1.5)
text(10,0.3,bquote(~nu == .(nu10)),col='black',cex=1.5)
# dev.off()