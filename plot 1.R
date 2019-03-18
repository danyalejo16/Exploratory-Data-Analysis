## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
annual <- NEI %>% group_by(year) %>% 
  filter(year == 1999|2002|2005|2008) %>% 
  summarize(Annual.Total = sum(Emissions));
pts <- pretty(annual$Annual.Total/1000000);
yrs <- c(1999,2002,2005,2008)
plot(annual$year, annual$Annual.Total/1000000, type = "l", lwd = 2, axes = FALSE,
     xlab = "Year", 
     ylab = expression("Total Tons of PM"[2.5]*" Emissions"), 
     main = expression("Total Tons of PM"[2.5]*" Emissions in the United States"));
axis(1, at = yrs, labels = paste(yrs));
axis(2, at = pts, labels = paste(pts, "M", sep = ""));
box()
# Save file
dev.copy(png, file = "Plot_1 DB.png", height = 480, width = 480)
dev.off()
