# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Generate a vector with only SCC codes for motor vehicles. I'm including both on-road and non-road,
# but excluding aircraft, marine and rail.
scc.mv<- factor(subset(SCC, grepl("^Mobile - ((On-Road) | (Non-Road)).*", EI.Sector))$SCC)

# Get Baltimore City, motor vehicle
bc.mv <- subset(NEI, fips=="24510" & SCC %in% scc.mv)

# Sum up over sources
total <- tapply(bc.mv$Emissions, bc.mv$year, sum)/1000 # Scale to Kilotons

png(filename="./Plot5.png")
barplot(total, main="Total Baltimore City Motor Vehicle Emissions (Kilotons)", xlab="Year", ylab=" Baltimore City Motor Vehicle Emissions (Kilotons)")
dev.off()

