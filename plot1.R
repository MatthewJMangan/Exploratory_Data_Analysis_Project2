# Read in data
setwd("C:/Users/Matt/datasciencecoursera/EDA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate total emissions by year in the USA
pm25sum<-with(NEI, tapply(Emissions, year, sum))

# Make barplot showing total emissions by year in the USA

png('plot1.png', width=640, height=480)
barplot(pm25sum~as.numeric(names(pm25sum)), xlab='Year', 
        ylab=expression('Total PM'[2.5]*' Emissions (tons)'),
        main = expression('Total PM'[2.5]*' Emissions in United States over Time'))
dev.off()