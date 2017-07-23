# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor
#    vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen
#    greater changes over time in motor vehicle emissions?
require(plyr)

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Generate a vector with only SCC codes for motor vehicles. I'm including both on-road and non-road,
# but excluding aircraft, marine and rail.
scc.mv<- factor(subset(SCC, grepl("^Mobile - ((On-Road) | (Non-Road)).*", EI.Sector))$SCC)

# Get Baltimore City, motor vehicle
bcla.mv <- subset(NEI, fips %in% c("24510","06037") & SCC %in% scc.mv)

# Reduce to get just the total emissions, scaled to Kilotons
s <- ddply(bcla.mv, .(year, fips), summarize, total=sum(Emissions)/1000)

png(filename="./Plot6.png", width=960, height=480)
par(mfrow=c(1,2))

with(s, plot(year, total, main="Total MV Emissions (Kilotons)", xlab="Year", ylab="Total Emissions (Kilotons)", type = "n"))
with(subset(s, fips == "24510"), points(year, total, col = "blue", pch=20, cex=3))
with(subset(s, fips == "24510"), lines(year, total, col = "blue", lwd=3))
with(subset(s, fips == "06037"), points(year, total, col = "red", pch=20, cex=3))
with(subset(s, fips == "06037"), lines(year, total, col = "red", lwd=3))
legend("right", pch = 20, col = c("blue", "red"), legend = c("Baltimore", "Los Angeles"))


# Now compute the differences
s$diff <- c(NA,NA,diff(s$total, lag=2, na.pad=false, by=fips))

with(s, plot(year, diff, main="Change In MV Emissions (Kilotons)", xlab="Year", ylab="Change (Kilotons)", type="n"))
with(subset(s, fips == "24510"), points(year, diff, col = "blue", pch=20, cex=3))
with(subset(s, fips == "24510"), lines(year, diff, col = "blue", lwd=3))
with(subset(s, fips == "06037"), points(year, diff, col = "red", pch=20, cex=3))
with(subset(s, fips == "06037"), lines(year, diff, col = "red", lwd=3))

par(mfrow=c(1,1))
dev.off()



