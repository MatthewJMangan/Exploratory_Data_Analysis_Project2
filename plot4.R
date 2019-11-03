# Read in data
setwd("C:/Users/Matt/datasciencecoursera/EDA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset emissions data by coal-related sources in the USA over time
mrg<-merge(NEI, SCC, by='SCC')
index<-grep("coal", mrg$Short.Name, ignore.case=TRUE)
mrg_sub<-mrg[index,]
pm25sum<-with(mrg_sub, tapply(Emissions, year, sum))

# Make barplot showing coal-related emissions in the USA over time
png('plot4.png', width=640, height=480)
barplot(pm25sum~as.numeric(names(pm25sum)), xlab='Year', 
        ylab=expression('Total PM'[2.5]*' Emissions (tons)'),
        main=expression('Total Coal-related PM'[2.5]*' Emissions in USA over Time'))
dev.off()
