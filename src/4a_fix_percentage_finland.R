#there are some issues with the finnish data. Due to the structure of the questionnaire, some variables only have "Yes" so percentages add up to 100%. We manually add the other answer here in order to get the graphs right.

data <- readRDS(file = "L:/DonorMedicin/FORTE/E Internation Donor Perception Survey/B Analysis/R/2. Datasets/combined.RDS")

row1<-c("Deferral", "Yes", sum(data$Count[data$country=="FIN"&data$Question=="Last_Deferral"]), "FIN")
row2<-c("LackDeferralInfo1", "No", sum(data$Count[data$country=="FIN"&data$Question=="Last_Deferral"])-sum(data$Count[data$country=="FIN"&data$Question=="LackDeferralInfo1"&data$Response=="Yes"]), "FIN")
row3<-c("LackDeferralInfo2", "No", sum(data$Count[data$country=="FIN"&data$Question=="Last_Deferral"])-sum(data$Count[data$country=="FIN"&data$Question=="LackDeferralInfo2"&data$Response=="Yes"]), "FIN")
row4<-c("LackDeferralInfo3", "No", sum(data$Count[data$country=="FIN"&data$Question=="Last_Deferral"])-sum(data$Count[data$country=="FIN"&data$Question=="LackDeferralInfo3"&data$Response=="Yes"]), "FIN")
row5<-c("LackDeferralInfo4", "No", sum(data$Count[data$country=="FIN"&data$Question=="Last_Deferral"])-sum(data$Count[data$country=="FIN"&data$Question=="LackDeferralInfo4"&data$Response=="Yes"]), "FIN")
row6<-c("LackDeferralInfo5", "No", sum(data$Count[data$country=="FIN"&data$Question=="Last_Deferral"])-sum(data$Count[data$country=="FIN"&data$Question=="LackDeferralInfo5"&data$Response=="Yes"]), "FIN")
row7 <- c("AccForIronLoss1", "No", sum(data$Count[data$country=="FIN"&data$Question=="AccForIronLoss"&data$Response=="Yes"])-sum(data$Count[data$country=="FIN"&data$Question=="AccForIronLoss1"&data$Response=="Yes"]), "FIN")
row8 <- c("AccForIronLoss2.FI", "No", sum(data$Count[data$country=="FIN"&data$Question=="AccForIronLoss"&data$Response=="Yes"])-sum(data$Count[data$country=="FIN"&data$Question=="AccForIronLoss2.FI"&data$Response=="Yes"]), "FIN")
row9 <- c("AccForIronLoss3.FI", "No", sum(data$Count[data$country=="FIN"&data$Question=="AccForIronLoss"&data$Response=="Yes"])-sum(data$Count[data$country=="FIN"&data$Question=="AccForIronLoss3.FI"&data$Response=="Yes"]), "FIN")
row10 <- c("AccForIronLoss4.FI", "No", sum(data$Count[data$country=="FIN"&data$Question=="AccForIronLoss"&data$Response=="Yes"])-sum(data$Count[data$country=="FIN"&data$Question=="AccForIronLoss4.FI"&data$Response=="Yes"]), "FIN")

df <- data.frame(
  Question = c(row1[1], row2[1], row3[1], row4[1], row5[1], row6[1], row7[1], row8[1], row9[1], row10[1]),
  Response = c(row1[2], row2[2], row3[2], row4[2], row5[2], row6[2], row7[2], row8[2], row9[2], row10[2]),
  Count = c(as.numeric(row1[3]), as.numeric(row2[3]), as.numeric(row3[3]), as.numeric(row4[3]), as.numeric(row5[3]), 
            as.numeric(row6[3]), as.numeric(row7[3]), as.numeric(row8[3]), as.numeric(row9[3]), as.numeric(row10[3])),
  country = c(row1[4], row2[4], row3[4], row4[4], row5[4], row6[4], row7[4], row8[4], row9[4], row10[4])
)

final_combined_df <- rbind(data, df)

saveRDS(final_combined_df, file = "L:/DonorMedicin/FORTE/E Internation Donor Perception Survey/B Analysis/R/2. Datasets/combined.RDS")