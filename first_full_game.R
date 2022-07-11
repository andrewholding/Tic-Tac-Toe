setwd("~/Desktop/Tic-Tac-Toe game/")

turn0Data<-read.delim('Raw Data/TicTac Toe_data_turn0.txt', stringsAsFactors = FALSE)
turn0Data$YELLOW<- as.numeric(turn0Data$YELLOW)


game1<-c('A1','B1','C1','A2','B2','C2','A3','B3','C3')
game2<-c('E1','F1','G1','E2','F2','G2','E3','F3','G3')
game3<-c('A5','B5','C5','A6','B6','C6','A7','B7','C7')
game4<-c('E5','F5','G5','E6','F6','G6','E7','F7','G7')

#e6positive<-c('C10','C11','C12')


library(ggpubr)


ggline(turn0Data[turn0Data$Well %in% game1,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn0Data[turn0Data$Well %in% game2,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn0Data[turn0Data$Well %in% game3,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn0Data[turn0Data$Well %in% game4,],x='Cycle',y='YELLOW',facet.by = 'Well')


#next run
turn1Data<-read.delim('Raw Data/TicTac Toe_data_turn1.txt', stringsAsFactors = FALSE)
turn1Data$YELLOW<- as.numeric(turn1Data$YELLOW)

ggline(turn1Data[turn1Data$Well %in% game1,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn1Data[turn1Data$Well %in% game2,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn1Data[turn1Data$Well %in% game3,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn1Data[turn1Data$Well %in% game4,],x='Cycle',y='YELLOW',facet.by = 'Well')


#next turn
turn2Data<-read.delim('Raw Data/TicTac Toe_data_turn2.txt', stringsAsFactors = FALSE)
turn2Data$YELLOW<- as.numeric(turn2Data$YELLOW)

ggline(turn2Data[turn2Data$Well %in% game1,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn2Data[turn2Data$Well %in% game2,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn2Data[turn2Data$Well %in% game3,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn2Data[turn2Data$Well %in% game4,],x='Cycle',y='YELLOW',facet.by = 'Well')



#next turn
turn3Data<-read.delim('Raw Data/TicTac Toe_data_turn3.txt', stringsAsFactors = FALSE)
turn3Data$YELLOW<- as.numeric(turn3Data$YELLOW)

ggline(turn3Data[turn3Data$Well %in% game1,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn3Data[turn3Data$Well %in% game2,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn3Data[turn3Data$Well %in% game3,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn3Data[turn3Data$Well %in% game4,],x='Cycle',y='YELLOW',facet.by = 'Well')


#next turn
turn4Data<-read.delim('Raw Data/TicTac Toe_data_turn4.txt', stringsAsFactors = FALSE)
turn4Data$YELLOW<- as.numeric(turn4Data$YELLOW)

ggline(turn4Data[turn3Data$Well %in% game1,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn4Data[turn3Data$Well %in% game2,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn4Data[turn3Data$Well %in% game3,],x='Cycle',y='YELLOW',facet.by = 'Well')
ggline(turn4Data[turn3Data$Well %in% game4,],x='Cycle',y='YELLOW',facet.by = 'Well')



multiData<-rbind(cbind(turn0Data,Turn='Turn0'),cbind(turn1Data,Turn='Turn1'),cbind(turn2Data,Turn='Turn2'),cbind(turn3Data,Turn='Turn3'),cbind(turn4Data,Turn='Turn4'))

ggline(multiData[multiData$Well %in% game1,],x='Cycle',y='YELLOW',facet.by = 'Well',color='Turn',title='Game1')
ggline(multiData[multiData$Well %in% game2,],x='Cycle',y='YELLOW',facet.by = 'Well',color='Turn',title='Game2')
ggline(multiData[multiData$Well %in% game3,],x='Cycle',y='YELLOW',facet.by = 'Well',color='Turn',title='Game3')
ggline(multiData[multiData$Well %in% game4,],x='Cycle',y='YELLOW',facet.by = 'Well',color='Turn',title='Game4')


multiData$Cycle<-as.numeric(multiData$Cycle)
multiData[multiData$Turn=='Turn0',]$Cycle
multiData[multiData$Turn=='Turn1',]$Cycle<-multiData[multiData$Turn=='Turn1',]$Cycle+60
multiData[multiData$Turn=='Turn2',]$Cycle<-multiData[multiData$Turn=='Turn2',]$Cycle+120
multiData[multiData$Turn=='Turn3',]$Cycle<-multiData[multiData$Turn=='Turn3',]$Cycle+180
multiData[multiData$Turn=='Turn4',]$Cycle<-multiData[multiData$Turn=='Turn4',]$Cycle+240

p1<-ggline(multiData[multiData$Well %in% game1,],x='Cycle',y='YELLOW',facet.by = 'Well',color='Turn',title='Game1') 
p2<-ggline(multiData[multiData$Well %in% game2,],x='Cycle',y='YELLOW',facet.by = 'Well',color='Turn',title='Game2')
p3<-ggline(multiData[multiData$Well %in% game3,],x='Cycle',y='YELLOW',facet.by = 'Well',color='Turn',title='Game3') 
p4<-ggline(multiData[multiData$Well %in% game4,],x='Cycle',y='YELLOW',facet.by = 'Well',color='Turn',title='Game4')

library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow=2)
