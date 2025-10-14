#funcao H
H<-function(a1,a2, a3, a4, a5, a6){
  integrand <- function(y){(y^a6)*exp(-a1*y - (a2*(y^(a3)) + a4)^(a5))}
  integralv<-integrate(integrand, 0, Inf)$value
  return (integralv) #essa seria a integral original calculada numericamente, para comparações
}


#density function
#x: data set
dg=function(y,param){
  theta1=param[1]
  theta2=param[2]
  theta3=param[3]
  theta4=param[4]
  theta5=param[5]
  theta6=param[6]
  
  c_theta=H(theta1, theta2, theta3, theta4, theta5, theta6)
  
  return((1/c_theta)*(y^theta6)*exp(-theta1*y-((theta2*y^theta3)+theta4)^theta5))
}
#exemplo
dg(seq(0,5,0.1)[-1],c(2, 1.5, 0.5, 0, 1, 0))
plot(seq(0,5,0.1)[-1], dg(seq(0,5,0.1)[-1],c(2, 1.5, 0.5, 0, 1, 0)), type="l")

#cumulative probability function
pg=function(x,param){
  theta1=param[1]
  theta2=param[2]
  theta3=param[3]
  theta4=param[4]
  theta5=param[5]
  theta6=param[6]
  c_theta=H(theta1, theta2, theta3, theta4, theta5, theta6)
  
  integrand <- function(y){(y^theta6)*exp(-theta1*y - (theta2*(y^(theta3)) + theta4)^(theta5))}
  integralv<-NULL
  for(i in 1:length(x)){
    integralv[i]<-(integrate(integrand, 0, x[i])$value)/c_theta
    
  }
  return(integralv)
}

pg(x=seq(0,5,0.1)[-1],c(2, 1.5, 0.5, 0, 1, 0))


x=c(29.19, 8.49, 7.37, 82.93, 44.18, 13.82, 22.28, 28.06, 6.84, 12.14, 
    153.78, 17.04, 13.47, 15.43, 30.36, 6.91, 22.12, 35.45, 44.66, 95.81, 
    6.18, 10.00, 58.39, 24.05, 17.03, 38.65, 47.17, 27.99, 11.84, 9.60, 
    6.72, 13.74, 14.60, 9.65, 10.39, 60.14, 15.51, 14.69, 16.44)

y=c(1.312, 1.314, 1.479, 1.552, 1.700, 1.803, 1.861, 1.865, 1.944, 1.958, 1.966, 
    1.977, 2.006, 2.021, 2.027, 2.055, 2.063, 2.098, 2.140, 2.179, 2.224, 2.240, 
    2.253, 2.270, 2.272, 2.274, 2.301, 2.301, 2.359, 2.382, 2.382, 2.426, 2.434, 
    2.435, 2.478, 2.490, 2.511, 2.514, 2.535, 2.554, 2.566, 2.570, 2.586, 2.629, 
    2.633, 2.642, 2.648, 2.684, 2.697, 2.726, 2.770, 2.773, 2.800, 2.809, 2.818, 
    2.821, 2.848, 2.880, 2.954, 3.012, 3.067, 3.084, 3.090, 3.096, 3.128, 3.233,
    3.433, 3.585, 3.585)

z=c(620, 470, 260, 89, 388, 242, 103, 100, 39, 460, 284, 1285, 218, 393, 106, 
    158, 152, 477, 403, 103, 69, 158, 818, 947, 399, 1274, 32, 12, 134, 660, 548, 
    381, 203, 871, 193, 531, 317, 85, 1410, 250, 41, 1101, 32, 421, 32, 343, 376,
    1512, 1792, 47, 95, 76, 515, 72, 1585, 253, 6, 860, 89, 1055, 537, 101, 385,  
    176, 11, 565, 164, 16, 1267, 352, 160, 195, 1279, 356, 751, 500, 803, 560, 151, 
    24, 689, 1119, 1733, 2194, 763, 555, 14, 45, 776, 1, 1747, 945, 12, 1453, 14, 
    150, 20, 41, 35, 69, 195, 89, 1090, 1868, 294, 96, 618, 44, 142, 892, 1307, 310, 
    230, 30, 403, 860, 23, 406, 1054, 1935, 561, 348, 130, 13, 230, 250, 317, 304, 
    79, 1793, 536, 12, 9, 256, 201, 733, 510, 660, 122, 27, 273, 1231, 182, 289, 
    667, 761, 1096, 43, 44, 87, 405, 998, 1409, 61, 278, 407, 113, 25, 940, 28, 
    848, 41, 646, 575, 219, 303, 304, 38, 195, 1061, 174, 377, 388, 10, 246, 323, 
    198, 234, 39, 308, 55, 729, 813, 1216, 1618, 539, 6, 1566, 459, 946, 764, 
    794, 35, 181, 147, 116, 141, 19, 380, 609, 546)


## Estimacoes enviadas pelo Tiago
fit_x=c(0, 0.0727, 1, 0, -1.564, -2.564)#Frechet
#
fit2_x=c(0.013, 0.364, 0.517, 0.0006, -5.089, -1.446)#new model
fit3_x=c(0.021, 0.0008, 3.973, 0.007, -9.51, -0.899)#new model

fit_y=c(0, 0.377, 1, 0, 5.50, 4.50)
fit2_y=c(0.002, 0.5, 0.80, 0.03, 5.44, 6.12)
fit3_y=c(0.0, 0.657, 0.621, 0.0, 5.394, 7.150)

fit_z=c(0.0018, 0, 1, 0, 1, -0.1726)
fit2_z=c(0.0015, 7.17, -6.55, 0.0018, 8.57, -0.29)
fit3_z=c(0.0017, 7.17, -6.55, 0.005, 8.57, -0.195)


 # plot(xpoints, dubs(ubs_fit,xpoints), type="l")

 library(e1071)
 
 (tab=summary(x))
 
 (tab_res=c(tab, Sd=sd(x),
            CS=skewness(x),
            CK=kurtosis(x))) 
 
 
(taby=summary(y))

(tab_resy=c(taby, Sd=sd(y),
           CS=skewness(y),
           CK=kurtosis(y))) 

(tabz=summary(z))

(tab_resz=c(tabz, Sd=sd(z),
            CS=skewness(z),
            CK=kurtosis(z))) 

tab_res=cbind.data.frame(as.data.frame(tab_res), as.data.frame(tab_resy),  as.data.frame(tab_resz))

names(tab_res)=c("X", "Y", "Z")

write.csv2(tab_res, file="descritivas_xyz.csv")


x11()
boxplot(x, main="Minimum monthly flow of water", ylab="Values")
boxplot(y, main="20 mm carbon fiber strengh", ylab="Values")
boxplot(z, main="Machine parts failure time", ylab="Values")


ks.test(x, pg,param=fit2_x)#D = 0.085375, p-value = 0.9156
ks.test(x, pg,param=fit3_x)#D = 0.17434, p-value = 0.1657

ks.test(y, pg,param=fit2_y)#D = 0.10714, p-value = 0.9999
ks.test(y, pg,param=fit2_y)[]$p.value
ks.test(y, pg,param=fit3_y)#D = 0.042773, p-value = 0.9996

ks.test(z, pg,param=fit2_z)#D = 0.039676, p-value = 0.9097
ks.test(z, pg,param=fit3_z) # MLE nao ajustou bem, mas LSE sim!
#D = 0.10392, p-value = 0.02603


library(goftest)
cvm.test(x, pg, param=fit2_x)# omega2 = 0.039944, p-value = 0.9357
cvm.test(x, pg, param=fit3_x)#omega2 = 0.17082, p-value = 0.3329
cvm.test(y, pg, param=fit2_y)# omega2 = 0.039944, p-value = 0.9357
cvm.test(y, pg, param=fit3_y)#omega2 = 0.17082, p-value = 0.3329
cvm.test(z, pg, param=fit2_z)# omega2 = 0.039944, p-value = 0.9357
cvm.test(z, pg, param=fit3_z)#omega2 = 0.17082, p-value = 0.3329


#montar uma tabela com os resultados dos testes de aderencia
#estatisticas e p-valores
tab_goodness_fit=data.frame(
    Dataset=c("X","X", "Y","Y", "Z", "Z"),
    Method = c("LSE", "MLE","LSE", "MLE","LSE", "MLE"),
    KS_stat = c(ks.test(x, pg,param=fit2_x)$statistic,
                ks.test(x, pg,param=fit3_x)$statistic,
                ks.test(y, pg,param=fit2_y)$statistic,
                ks.test(y, pg,param=fit3_y)$statistic,
                ks.test(z, pg,param=fit2_z)$statistic,
                ks.test(z, pg,param=fit3_z)$statistic),
    KS_pvalue = c(ks.test(x, pg,param=fit2_x)$p.value,
                  ks.test(x, pg,param=fit3_x)$p.value,
                  ks.test(y, pg,param=fit2_y)$p.value,
                  ks.test(y, pg,param=fit3_y)$p.value,
                  ks.test(z, pg,param=fit2_z)$p.value,
                  ks.test(z, pg,param=fit3_z)$p.value),
    CVM_stat = c(cvm.test(x, pg, param=fit2_x)$statistic,
                 cvm.test(x, pg, param=fit3_x)$statistic,
                 cvm.test(y, pg, param=fit2_y)$statistic,
                 cvm.test(y, pg, param=fit3_y)$statistic,
                 cvm.test(z, pg, param=fit2_z)$statistic,
                 cvm.test(z, pg, param=fit3_z)$statistic),
    CVM_pvalue = c(cvm.test(x, pg, param=fit2_x)$p.value,
                   cvm.test(x, pg, param=fit3_x)$p.value,
                   cvm.test(y, pg, param=fit2_y)$p.value,
                   cvm.test(y, pg, param=fit3_y)$p.value,
                   cvm.test(z, pg, param=fit2_z)$p.value,
                   cvm.test(z, pg, param=fit3_z)$p.value)
)

tab_goodness_fit

write.csv2(tab_goodness_fit, file="./goodness_fit.csv")
#### ---------------------------------------------
### Histograma vs densidade ajustada
### ---------------------------------------------
x11()
#par(mfrow=c(3,1))


g1=dg(sort(x),fit_x)
g2=dg(sort(x),fit2_x)
g3=dg(sort(x),fit3_x)


hist(x, breaks = 15, probability = T, main="Minimum monthly flow of water", xlab = "x",
     ylim = c(0,0.06))
lines(sort(x), g1, type="l", 
      pch=16, 
      lty=3, 
      lwd=2.0,
      col="red") 

lines(sort(x), g2, type="l", 
      pch=16, 
      lty=2, 
      lwd=2.0,
      col="black") 

lines(sort(x), g3, type="l", 
      pch=16, 
      lty=1, 
      lwd=2.0,
      col="blue") 

legend("topright", inset=.1,
       #y=.3,
       #title="",
       c("Fréchet model",
         "H-extreme (LSE)",
         "H-extreme (MLE)"), 
       lty=c(3,2,1), pch=c(NA),
       col=c("red", "black", "blue")) 

dev.print(pdf, 'hist_x.pdf')

##y
g1=dg(sort(y),fit_y)
g2=dg(sort(y),fit2_y)
g3=dg(sort(y),fit3_y)


hist(y, breaks = 15, probability = T, main="20 mm carbon fiber strengh", xlab = "y",
     ylim = c(0,1))
lines(sort(y), g1, type="l", 
      pch=16, 
      lty=1, 
      lwd=2.0,
      col="red") 

lines(sort(y), g2, type="l", 
      pch=16, 
      lty=2, 
      lwd=2.0,
      col="black") 

lines(sort(y), g3, type="l", 
      pch=16, 
      lty=3, 
      lwd=2.0,
      col="blue") 

legend("topleft", inset=.01,
       #y=.3,
       #title="",
       c("Weibull model",
         "H-extreme (LSE)",
         "H-extreme (MLE)"), 
       lty=c(1,2,3), pch=c(NA),
       col=c("red", "black", "blue")) 

dev.print(pdf, 'hist_y.pdf')

##z
g1=dg(sort(z),fit_z)
g2=dg(sort(z),fit2_z)
g3=dg(sort(z),fit3_z)


hist(z, breaks = 50, probability = T, main="Machine parts failure time", xlab = "z",
     ylim = c(0,0.005))
lines(sort(z), g1, type="l", 
      pch=16, 
      lty=3, 
      lwd=2.0,
      col="red") 

lines(sort(z), g2, type="l", 
      pch=16, 
      lty=2, 
      lwd=2.0,
      col="black") 

lines(sort(z), g3, type="l", 
      pch=16, 
      lty=1, 
      lwd=2.0,
      col="blue") 

legend("topright", inset=.01,
       #y=.3,
       #title="",
       c("Gamma model",
         "H-extreme (LSE)",
         "H-extreme (MLE)"), 
       lty=c(1,2,3), pch=c(NA),
       col=c("red", "black", "blue")) 

dev.print(pdf, 'hist_z.pdf')

#### ---------------------------------------------
### Normal QQPlot
### ---------------------------------------------
x11()
par(mfrow=c(1,3))

library(ecostats)
residuo1=qnorm(pg(x, fit_x))
qqenvelope(residuo1, ylab = "Randomized Quantile Residuals",
           main = "Fréchet model", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo1, col = 2)

residuo2=qnorm(pg(x, fit2_x))
qqenvelope(residuo2, ylab = "Randomized Quantile Residuals", 
           main = "H-extreme (LSE)", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo2, col = 2)

residuo3=qnorm(pg(x, fit3_x))
qqenvelope(residuo3, ylab = "Randomized Quantile Residuals",
           main = "H-extreme (MLE)", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo3, col = 2)


dev.print(pdf, 'qq_x.pdf')


residuo1=qnorm(pg(y, fit_y))
qqenvelope(residuo1, ylab = "Randomized Quantile Residuals",
           main = "Weibull model", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo1, col = 2)

residuo2=qnorm(pg(y, fit2_y))
qqenvelope(residuo2, ylab = "Randomized Quantile Residuals",
           main = "H-extreme (LSE)", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo2, col = 2)

residuo3=qnorm(pg(y, fit3_y))
qqenvelope(residuo3, ylab = "Randomized Quantile Residuals",
           main = "H-extreme (MLE)", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo3, col = 2)

dev.print(pdf, 'qq_y.pdf')

residuo1=qnorm(pg(z, fit_z))
qqenvelope(residuo1, ylab = "Randomized Quantile Residuals",
           main = "Gamma model", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo1, col = 2)

residuo2=qnorm(pg(z, fit2_z))
residuo2=residuo2[!is.infinite(residuo2)]
qqenvelope(residuo2, ylab = "Randomized Quantile Residuals",
           main = "H-extreme (LSE)", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo2, col = 2)

residuo3=qnorm(pg(z, fit3_z))
residuo3=residuo3[!is.infinite(residuo3)]
qqenvelope(residuo3, ylab = "Randomized Quantile Residuals",
           main = "H-extreme (MLE)", 
           cex.main=1.5, cex.lab=1.5)
qqline(residuo3, col = 2)

dev.print(pdf, 'qq_z.pdf')

# # QQ-plot padrão para inspecionar visualmente
# residuo1=qnorm(pg(x, fit_x))
# qqnorm(residuo1, main="Fréchet model", ylab = "Randomized Quantile Residuals",
#        ylim=c(-3.5,-1.5))
# qqline(residuo1, col = "red")
# 
# residuo2=qnorm(pg(x, fit2_x))
# qqnorm(residuo2, main="H-extreme",ylab = "Randomized Quantile Residuals",
#        ylim=c(-3.5,-0))
# qqline(residuo2, col = "red")
# 
# residuo3=qnorm(pg(x, fit3_x))
# qqnorm(residuo3, main="H-extreme",ylab = "Randomized Quantile Residuals",
#        ylim=c(-3.5,-0))
# qqline(residuo2, col = "red")
# 
# # QQ-plot padrão para inspecionar visualmente
# residuo1=qnorm(pg(y, fit_y))
# qqnorm(residuo1, main="Fréchet model", ylab = "Randomized Quantile Residuals",
#        ylim=c(-3.5,-1.5))
# qqline(residuo1, col = "red")
# 
# residuo2=qnorm(pg(y, fit2_y))
# qqnorm(residuo2, main="H-extreme",ylab = "Randomized Quantile Residuals",
#        ylim=c(-3.5,-0))
# qqline(residuo2, col = "red")
# 
# # QQ-plot padrão para inspecionar visualmente
# residuo1=qnorm(pg(z, fit_z))
# qqnorm(residuo1, main="Fréchet model", ylab = "Randomized Quantile Residuals",
#        ylim=c(-3.5,-1.5))
# qqline(residuo1, col = "red")
# 
# residuo2=qnorm(pg(z, fit2_z))
# qqnorm(residuo2, main="H-extreme",ylab = "Randomized Quantile Residuals",
#        ylim=c(-3.5,-0))
# qqline(residuo2, col = "red")