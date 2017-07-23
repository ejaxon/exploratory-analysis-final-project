# 4. Across the United States, how have emissions from coal combustion-related sources changed
#    from 1999–2008?

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Generate a vector with only SCC codes for coal combustion-related sources
scc.cc<- factor(subset(SCC, grepl("^Fuel Comb.*[Cc]oal.*", EI.Sector))$SCC)

# Get the subset of the NEI data with those SCC codes
nei.cc <- subset(NEI, SCC %in% scc.cc)

# Sum up over sources
total <- tapply(nei.cc$Emissions, nei.cc$year, sum)/1000 # Scale to Kilotons

png(filename="./Plot4.png")
barplot(total, main="Total U.S. Coal Combustion-Related Emissions (Kilotons)", xlab="Year", ylab="Coal Combustion-Related Emissions (Kilotons)", ylim=c(0,600))

dev.off()

