# Read in data
setwd("C:/Users/Matt/datasciencecoursera/EDA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load ggplot
library(ggplot2)

# Subset emissions data by source type in Baltimore City
NEIsub <-subset(NEI, fips=='24510')
NEIsubsum <- aggregate(Emissions ~ year + type, NEIsub, sum)

# Make Line plot showing total emissions by source type in Baltimore City 
png('plot3.png', width=640, height=480)
g<-ggplot(data=NEIsubsum, aes(year, Emissions, color=type))
g<-g+ geom_line() +
        xlab("Year") +
        ylab(expression('Total PM'[2.5]*' Emissions (tons)')) +
        ggtitle(expression('Total PM'[2.5]*' Emissions in Baltimore City over Time by Source'))
print(g)
dev.off()