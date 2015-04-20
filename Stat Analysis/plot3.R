# read in the data
neiData <- readRDS("./data/summarySCC_PM25.rds")
sccData <- readRDS("./data/Source_Classification_Code.rds")
head(neiData)
head(sccData)

# prepare for the plot
subset <- neiData[neiData$fips == "24510", ] 
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot3.png", 
    width = 480, height = 480, 
    units = "px")

# draw the plot
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()