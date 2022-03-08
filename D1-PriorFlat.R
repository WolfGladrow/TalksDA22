print('file: D1-PriorFlat.R') 
xp = c(-0.5,1.5); yp = c(1,1)
# png('PriorFlat220308.png',width=16,height=12,units='cm',res=300)
plot(xp,yp,type='l',lwd=3,col='magenta',las=1,cex=0.4,
     xaxt='n',yaxt='n',xlab='x',ylab='Flat prior', # bty='n',
     xlim=c(0,1),ylim=c(0,1.5),cex.lab=1.5)
# dev.off()