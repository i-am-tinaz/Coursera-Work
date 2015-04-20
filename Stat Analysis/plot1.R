# read in the data
neiData <- readRDS("./data/summarySCC_PM25.rds")
sccData <- readRDS("./data/Source_Classification_Code.rds")
head(neiData)
head(sccData)

# prepare for the plot
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot1.png", 
    width = 480, height = 480, 
    units = "px")
totalEmissions <- aggregate(neiData$Emissions, list(neiData$year), FUN = "sum")

# draw the plot
plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()