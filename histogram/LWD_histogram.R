LWD <- read.csv("LWD.csv")


library(ggplot2)
library(ggthemes)

Thickness <- LWD$Thickness
hist(Thickness)


Thickness <- LWD$Thickness
hist(Thickness, breaks = 20, main = " ", col = "skyblue",
     xlab = "Thickness of Lutzenguetle Pottery (mm)",
     cex.main = 1.4, cex.lab = 1.3, cex.axis = 1.2)


Thickness <- LWD$Thickness
hist(Thickness, breaks = 30, main = " ", col = "grey80",
     xlab = "Thickness of Lutzenguetle Pottery (mm)",
     cex.main = 1.4, cex.lab = 1.3, cex.axis = 1.2)


Thickness <- LWD$Thickness
hist(Thickness, breaks = 20, freq = FALSE, main = " ", 
     border = "skyblue", col = "skyblue",
     xlab = "Thickness of Lutzenguetle Pottery (mm)",
     cex.main = 1.4, cex.lab = 1.3, cex.axis = 1.2)
lines(density(Thickness, bw = 4), lwd = 2, col = "red")


library(ggplot2); library(grid)
ggplot(data = LWD, aes(x = Thickness)) + geom_histogram(bins = 20)




### Now we are using LWD2.csv

LWD2 <- read.csv("LWD2.csv")

Percentage <- LWD2$Percentage; Period <- LWD2$Period
barplot(Percentage, names.arg = Period, xlab = "Period ", 
        ylab = "Percentage ", cex.names = 0.7)


Percentage <- LWD2$Percentage; Period <- LWD2$Period 
Width <- LWD2$Width
barplot(Percentage/Width, space = 0, width = Width, col =  "skyblue",
        names.arg = Period, xlab = "Period", axes = F, cex.names = 0.5) 


LWD <- read.csv("LWD.csv")



fig4.7 <- function() {
  library(ggplot2); library(grid)
  
  p <- ggplot(data = LWD, aes(x = Thickness)) +
    geom_histogram(aes(y=..density..), bins = 20, fill = "gray", colour = "red") +
    geom_density() +
    facet_grid(Date ~ ., scales = "free_y") + # make y axes independent for all grid elements
    theme(panel.grid.minor = element_blank()) +
    xlab("lengths (mm)") + ggtitle("Thickness Lutzenguetle Pottery") +
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14)) +
    theme(plot.title = element_text(size = 16, face="bold"))
  
  p
}

fig4.7()







fig4.8a <- function() {
  Length <- LWD$Thicknes; Date <- LWD$Date
  Early <- Length[Date == "Early"]
  Late <- Length[Date == "Late"]
  Breaks <- seq(50, 140, 5)
  
  hist(Early, breaks = Breaks, ylim = c(0, 15),
       col = "#FF000060", main = " ",
       xlab = "Thickness Lutzenguetle Pottery (mm)",
       cex.lab = 1.3, cex.axis = 1.2)
  
  hist(Late, breaks = Breaks, col = "#0000FF60",add = T)
  legend("topright", c("Early", "Late"),
         fill = c("#FF000060", "#0000FF60"),
         bty = "n", cex = 1.5)
}

fig4.8a()






fig4.8b <- function() {
  library(ggplot2); library(grid)
  
  p <- ggplot(data = LWD, aes(x = Thickness, fill = Date)) +
    geom_histogram(binwidth = 5, boundary = 50,
                   position = "identity", alpha = 0.6) +
    scale_fill_manual(values = c("red", "blue", "green")) +
    xlab("Thickness Lutzenguetle Pottery (mm)") +
    theme(panel.grid.minor = element_blank()) +
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14)) +
    theme(plot.title = element_text(size = 16, face="bold")) +
    theme(legend.position="top",legend.text=element_text(size=14),
          legend.title=element_text(size=16),
          legend.key.height=unit(.8, "cm"), legend.key.width=unit(.8, "cm"))
  
  p
}

fig4.8b()







fig4.9a <- function() {
  library(ggplot2); library(grid)
  
  p <- ggplot(LWD, aes(x = Thickness)) + 
    geom_freqpoly(binwidth = 5) +
    xlab("Thickness (mm)") + ylab("Count") + ggtitle("Thickness Lutzenguetle Pottery (mm)") +
    theme(axis.text=element_text(size=12), axis.title=element_text(size=14)) +
    theme(plot.title = element_text(size = 16, face="bold"))
  
  p
}

fig4.9a()




fig4.9b <- function() {
  library(ggplot2); library(grid)
  
  p <- ggplot(LWD, aes(x = Thickness, colour = Date)) +
    geom_freqpoly(binwidth = 5, size = 1.2) +xlab("Thinckness (mm)") + ylab("Count") + ggtitle("Thickness Lutzenguetle Pottery (mm)") +
    theme(axis.text=element_text(size=12), axis.title=element_text(size=14)) +
    theme(plot.title = element_text(size = 16, face="bold")) +
    theme(legend.position="top", legend.text=element_text(size=14), legend.title=element_text(size=16), legend.key.height=unit(.8, "cm"), legend.key.width=unit(.8, "cm"))
  
  p
}

fig4.9b()




LWD3 <- read.csv("LWD3.csv")


plot(density(LWD3$Weight))

library(ggplot2); library(grid)
ggplot(data = LWD3, aes(x=Weight)) + geom_density()


loomweights <- LWD3 [1:135,  ]
Weight <- loomweights$Weight; Height <- loomweights$Height



fig6.4a <- function() {
  kde_lw <- density(Weight, adjust = 0.6)
  plot(kde_lw, xlab = "Weight", main = "", lwd = 3,
       col = "blue", cex.axis = 1.2, cex.lab = 1.3)
  lines(density(Weight, adjust = 1), col = "red", lwd = 3, lty = 2)
  legend("topright", c("26.85", "16.11"), col = c("red", "blue"),
         lwd = c(3, 3), lty = c(2, 1), title = "Bandwidth", bty = "n", cex = 1.5)
}

fig6.4a()






fig6.4b <- function() {
  library(ggplot2); library(grid)
  
  ggplot(LWD3 [1:135,], aes(x=Weight)) +
    geom_line(stat = "density", adjust=0.5, colour="blue",
              size=1.3) + xlim(0, 450) +
    geom_line(stat="density", adjust=1.0, colour="red",
              linetype="dashed", size=1.3) +
    xlab("weight") + ylab("density") +
    theme(panel.grid.minor = element_blank()) +
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14)) +
    theme(plot.title = element_text(size = 16, face="bold")) +
    theme(legend.position="top",
          legend.text=element_text(size=14),
          legend.title=element_text(size=16),
          legend.key.height=unit(.8, "cm"), legend.key.width=unit(.8, "cm"))
}
fig6.4b()




hist(Weight, breaks = 20, freq = FALSE, main = " ", col = "skyblue",
     xlab = "Weights (g)", ylab = "Density", xlim = c(0,450),
     cex.main = 1.4, cex.lab = 1.3, cex.axis = 1.2)
lines(density(Weight, bw = 20), lwd = 2, col = "red")





fig6.6b <- function() {
  library(ggplot2); library(grid)
  
  ggplot(loomweights, aes(x = Weight, y = ..density..)) +
    geom_histogram(binwidth = 20, fill = "green") +
    geom_density(adjust = 0.6, size = 1.1) + xlim(0,450) +
    xlab("weight") + ylab("density") +
    theme(panel.grid.minor = element_blank()) +
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14)) +
    theme(plot.title = element_text(size = 16, face="bold")) +
    theme(legend.position="top",
          legend.text=element_text(size=14),
          legend.title=element_text(size=16),
          legend.key.height=unit(.8, "cm"), legend.key.width=unit(.8, "cm"))
}
fig6.6b()






fig6.7a <- function() {
  Length <- LWD$Thickness; Date <- LWD$Date
  Early <- Length[Date == "Early"]
  Late <- Length[Date == "Late"]
  plot(density(Early), lwd = 3, main = "",
       xlab = "Romano-British hairpin lengths (mm)",
       col = "blue", xlim = c(40, 140),
       cex.main = 1.4, cex.lab = 1.3, cex.axis = 1.2)
  lines(density(Late), lwd = 2, col = "red")
  legend("topright", c("Early", "Late"), col = c("blue", "red"),
         lwd = c(3,3), lty = c(1,1), bty = "n", cex = 1.5)
}

fig6.7a()




fig6.7b<- function() {
  library(ggplot2); library(grid)
  
  ggplot(LWD, aes(x = Thickness, colour = Date)) +
    geom_density(size = 1.3) + xlim(40,140) +
    scale_colour_manual(values = c("blue", "red", "green")) +
    xlab("Length (mm)") + ylab("Density") +
    theme(panel.grid.minor = element_blank()) +
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14)) +
    theme(plot.title = element_text(size = 16, face="bold")) +
    theme(legend.position="top",
          legend.text=element_text(size=14),
          legend.title=element_text(size=16),
          legend.key.height=unit(.8, "cm"), legend.key.width=unit(.8, "cm"))
}
fig6.7b()





fig6.8 <- function() {
  library(ggplot2); library(grid) 
  
  ggplot(LWD3, aes(x=Weight, y=Height)) +
    geom_point(size=3) +
    
    stat_density2d(aes(colour="red"), size=1.1, h=c(100,20)) +          # a
    
    #stat_density2d(aes(fill=..level..), geom="polygon", h=c(100,20)) +  # b
    
    #stat_density2d(aes(fill=..density..), geom="raster", contour=FALSE, # c
    #h=c(100,20)) +                                                      # c
    
    #stat_density2d(aes(alpha =..density..), geom="tile", contour=FALSE, # d
    #h=c(100,20)) +                                                      # d
    
    xlim(50,450) + ylim(40,130) +
    theme(panel.grid.minor = element_blank()) +
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14)) +
    theme(legend.position="none")
}
fig6.8()






Weight <- LWD3$Weight; Height <- LWD3$Height

library(MASS)
dens <- kde2d(Weight, Height, h = c(120, 20), n = 100,
              lims = c(50, 450, 40, 130))

image(dens, xlab = "Weight", ylab = "Height")





Weight <- LWD3$Weight; Height <- LWD3$Height

library(MASS)
dens <- kde2d(Weight, Height, h = c(120, 20), n = 100,
              lims = c(50, 450, 40, 130))

persp(dens, col = "green", theta = 30, phi = 25,
      ticktype = "detailed", nticks = 3,
      xlab = "Height", ylab = "Weight", zlab = "Density",
      cex.lab = 1.3, cex.axis = 1.2)



Weight <- LWD3$Weight; Height <- LWD3$Height

fig6.10a <- function() {
  library(MASS)
  dens <- kde2d(Weight, Height, h = c(120, 20), n = 100,
                lims = c(50, 450, 40, 130))
  
  contour(dens, xlim = c(40, 440), ylim = c(40,130), lwd = 2, col = "red", drawlabels = F, main = "Diagonal bandwidth matrix", xlab = "Weight (g)", ylab = "Height (mm)", cex.lab = 1.3, cex.axis = 1.2, cex.main = 1.4, cex = 1.2)
  points(loomweights, pch = 16)
}

fig6.10a()




Weight <- LWD3$Weight; Height <- LWD3$Height

fig6.10a <- function() {
  library(MASS)
  dens <- kde2d(Weight, Height, h = c(120, 20), n = 100,
                lims = c(50, 450, 40, 130))
  
  contour(dens, xlim = c(40, 440), ylim = c(40,130), lwd = 2, col = "red", drawlabels = F, main = "Diagonal bandwidth matrix", xlab = "Weight (g)", ylab = "Height (mm)", cex.lab = 1.3, cex.axis = 1.2, cex.main = 1.4, cex = 1.2)
  points(LWD3, pch = 16)
}

fig6.10a()


