#changing working directory 
getwd()
setwd("/Users/anyakapur/Desktop/Biostat/finalproject/script")
save.image()

#loading data 
hipp <- read.csv("hippvolume.csv")

#analysis 

hipp$group <- factor(hipp$group, levels = c("no seizures", "no CFS", "CFS")) 

hipp
hippAnova <- lm(hipp$hippoVolumeRatio ~ group, data = hipp)
anova(hippAnova)
setwd("/Users/anyakapur/Desktop/Biostat/finalproject/script")
save()

#making bar plots 
setwd("/Users/anyakapur/Desktop/Biostat/finalproject/results")
pdf("hipp_plot.pdf")
graph <- stripchart(hipp$hippoVolumeRatio ~ hipp$group, data = hipp, method = "jitter",
           vertical = TRUE, ylab = "Hippocampus Volume Ratio", xlab = "Patients", col = c("coral3", "darkslategrey", "darkolivegreen"), cex = 1.5, 
           main = "Hippocampus Volume Ratio for Patients", pch=16)
meanHipVol = tapply(hipp$hippoVolumeRatio, hipp$group, mean)
segments(x0 = c(1,2,3) - 0.1, y0 = meanHipVol, x1 = c(1,2,3) + 0.1, 
         y1 = meanHipVol, lwd = 2)
dev.off


