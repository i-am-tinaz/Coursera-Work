# read in the data
neiData <- readRDS("./data/summarySCC_PM25.rds")
sccData <- readRDS("./data/Source_Classification_Code.rds")
head(neiData)
head(sccData)

# prepare for the plot
subset <- neiData[neiData$fips == "24510", ] 
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot5.png", 
    width = 480, height = 480, 
    units = "px")
motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

# draw the plot
plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()