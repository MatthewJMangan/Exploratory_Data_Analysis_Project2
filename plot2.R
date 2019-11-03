# Read in data
setwd("C:/Users/Matt/datasciencecoursera/EDA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate total emissions by year in Baltimore City
pm25sumBALT<-with(NEI, tapply(Emissions[fips=='24510'], year[fips=='24510'], sum))

# Make barplot showing total emissions by year in Baltimore City
png('plot2.png', width=640, height=480)
barplot(pm25sumBALT~as.numeric(names(pm25sumBALT)), xlab='Year', 
        ylab = expression('Total PM'[2.5]*' Emissions (tons)'), 
        main = expression('Total PM'[2.5]*' Emissions in Baltimore City over Time'))
dev.off()