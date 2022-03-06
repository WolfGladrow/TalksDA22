print('file: A1-EdelweissScatter1.R')
# Scatter plot: Edelweiss data
x = c(1853,1872,1899,1949,1976,1981,2001,2027,2033,2044,2111,2166,2245)
# png('EdelweissScatter171020.png',width=16,height=12,units='cm',res=300)
plot(x,type='p',lwd=3,col='blue',xlab='Data #',ylab='x (m)',las=1,cex=0.4,cex.lab=1.5)
# dev.off()
# ----------------------------------------------------------------
# Remarks:
# c()       concatenate: Combine Values into a Vector or List
# ?         ask for explanations
# ?c        ask for explanations for c()
# png()     define plot format; has to be called before calling plot()
# dev.off() shuts down all open graphics devices; has to be called to finish plot-file on your computer
# ----------------------------------------------------------------