print('file: B2-PDsPDFsBrokenStickPDexample.R')
# broken stick distribution
n = 10; karr = seq(1,n); pk = seq(1,n); kinv = 1/karr;
for(k in 1:n) pk[k]=sum(kinv[k:n])/n
# png('BrokenStick160817.png',width=16,height=16,units='cm',res=300)
plot(karr,pk,type='p',lwd=4,col='black',xlab='k',
     ylab='Probability',las=1,cex=0.6,cex.lab=1.5)
# dev.off()