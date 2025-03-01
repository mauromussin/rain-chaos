rm(list = ls())
dev.off()
help.start()

# install.packages("astsa")
library("astsa")
library("xts")
library("readr")
library("lubridate")
# install.packages("dplyr")
library("dplyr")

setwd("C:\\Users\\39349\\OneDrive\\Desktop\\Projects\\Su-git-hub\\rain-chaos")
getwd()

df <- read.csv("Precipitazioni_dal_2011_al_2020_20250215.csv", header = TRUE)

df$Data <- dmy_hms(df$Data)
str(df)

is.unsorted(df$Data) # Ritorna TRUE -> Da ordinare

df <- df[order(df$Data), ] # riordina i dati

# Generate a complete sequence of timestamps from min to max with 10-min intervals
expected_times <- seq(from = min(df$Data), to = max(df$Data), by = "10 min")
min(df$Data)
max(df$Data)

# Find missing timestamps
missing_times <- setdiff(expected_times, df$Data)

# Check if there are missing timestamps
if (length(missing_times) > 0) {
  cat("There are", length(missing_times), "missing timestamps.\n")
} else {
  cat("No missing timestamps!\n")
}

df <- data.frame(Data = expected_times) %>% left_join(df, by = "Data")

df <- df[df$Data >= "2014-07-19 00:00:00", ] # rimuovo il primo giorno di misurazioni


xts_data <- xts(df$Valore, order.by = df$Data) # serie temporale

xts_data[xts_data < 0] <- NA

weekly_avg <- apply.weekly(xts_data, sum)

weekly_avg <- weekly_avg[weekly_avg > 1]
summary(weekly_avg)


plot(weekly_avg)

tau <- 1

weekly_avg_shifted <- lag.xts(weekly_avg, k = -1)


plot(as.numeric(weekly_avg), as.numeric(weekly_avg_shifted),
     xlab = "Weekly Average (Current Week)", ylab = "Weekly Average (Next Week)",
     main = "Weekly Average vs Next Week's Average", type = "l", col = "blue",
     lty = 1, lwd = 2)

# Recurrence analysis

install.packages("crqa")
library("crqa")

weekly_avg_clean <- na.omit(weekly_avg)
weekly_avg_lagged <- lag.xts(weekly_avg_clean, k = -1)
result <- piecewiseRQA(as.numeric(weekly_avg_clean[,1]),
                       as.numeric(weekly_avg_lagged[,1]),
                       delay = 1, 
                       radius = 0.1,
                       blockSize = 1)

image(result$RP)
result$RP
