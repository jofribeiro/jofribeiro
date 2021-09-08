#______###                   CCCCC  U     U  RRRRR     AAAAA   DDDDD       OOOOO    RRRRR    II   AAAAA
#_____#   #                C        U     U  R     R        A  D     D    O     O   R     R  II        A
#______###                C         U     U  R     R        A  D      D  O       O  R     R  II        A
#______# #                C         U     U  RRRRR     AAAAAA  D      D  O       O  RRRRR    II   AAAAAA
#____### ###              C         U     U  R   R    A     A  D      D  O       O  R   R    II  A     A
#__##  ###  ###            C        U     U  R    R   A     A  D     D    O     O   R    R   II  A     A
##              #            CCCCC   UUUUU   R     R   AAAAA   DDDDD       OOOOO    R     R  II   AAAAA
#                #                                                           # # # # 
#    ###############      PPPPP     L        U     U    SSSSSS           #     ###     #
#   #   #############     P     P   L        U     U   S              #        ###        #
#  #   #           ###    P     P   L        U     U   S           #    ###   # # #    ###   #
#  #   # ###   ###  ##    PPPPP     L        U     U    SSSSS    #      ###  #  #  #   ###     #
#  #   #           ###    P         L        U     U         S   #         #   ###   #         #
#   #   #############     P         L        U     U         S    #      #     ###     #      #
#   ##############        P          LLLLL    UUUUU    SSSSSS      # # #       ###       # # #
#  #  #  #  #  #                                                             Wall- E
# ##############          
#  #  #  #  #  #
#  ###############
# CODIGO ----
nome <- '880_VARREDOR'
comeco <- Sys.time()
# PACOTES----
pacotes<-c("tryCatchLog","httr","jsonlite","RPostgreSQL","RODBC","reshape","readbulk","plotly","lubridate","readxl","HH","sqldf","dplyr","data.table","arules","dgof","pROC","Information","InformationValue","stringr","tree","rpart","Amelia","ggplot2","descr","scales","ggthemes","ztable","tibble","tidyr","RCurl","purrr") 
# REMOVA O COMENTARIO ABAIXO PARA INSTALAR OS PACOTES
# install.packages(pacotes)
# CARREGANDO TODOS OS PACOTES
lapply(pacotes, require, character.only = TRUE)

# NAO MODIFIQUE ESSA PARTE DO CODIGO PARA QUE O BENDER SEJA EXECUTADO CORRETAMENTE
write.csv(x = as.character(tryLog({
  # BENRDER ----
  pop <- F
  try(setwd(paste0('C:/Users/jofribeiro/OneDrive - PASCHOALOTTO SERVICOS FINANCEIROS LTDA/db_bender')))
  try(pastas <- as.data.frame(list.files('.')) %>% 
        dplyr::select(lista = `list.files(".")`) %>% 
        dplyr::filter(as.character(gsub('.txt','',lista)) == nome))
  try(if (nrow(pastas) > 0) {
    try(t <- read.table(file = as.character(pastas$lista[1]),sep = ';',header = F))
    try(file.remove(as.character(pastas$lista[1])))
    try(write.table(paste0(as.character(gsub('.txt','',t$V1[1])),'_',Sys.time()),paste0('C:/SKYC/00 - LOG/',as.character(gsub('.txt','',t$V1[1])),'_',Sys.Date(),'_',(gsub("[^0-9]", "", substring(Sys.time(),11,16))),'.csv'),col.names = F,row.names = F))
    pop <- T
  })

  # USE O ESQUEMA DE DATAS ACIMA PARA QUE O BENDER RODE SEU CODIGO
  # COLOQUE SEU CODIGO NESSE INTERVALO ----
  setwd(paste0('//MTZ-FS-002/MIS_Santander/01 - CARTEIRAS/880 - MELHORIA TEAM/96 - BD WALL.E/02 - LOG'))
  check <- as.data.frame(list.files('.')) %>% 
    dplyr::select(lista = `list.files(".")`)
  
  if (as.numeric(nrow(check)) > 0) {
    for (y in 1:nrow(check)) {
      file.remove(as.character(check$lista[y]))
    }
  }
  
  # FIM DO INTERVALO DO SEU CODIGO----
  # SALVANDO O LOG DE CONCLUSAO ----
  setwd('//gruponp.local/fs/MIS_Santander/01 - CARTEIRAS/880 - MELHORIA TEAM/99 - BD VM')
  write.table(paste0(nome,'_',comeco,'_',Sys.time()),paste0(nome,'_',Sys.Date(),'_',(gsub("[^0-9]", "", substring(Sys.time(),11,16))),'.csv'),col.names = F,row.names = F)
  # SALVANDO LOG E RDA CASO DE ERRO ----
},write.error.dump.file = T,write.error.dump.folder = '//gruponp.local/fs/MIS_Santander/01 - CARTEIRAS/880 - MELHORIA TEAM/96 - BD WALL.E/02 - LOG')),
paste0('//gruponp.local/fs/MIS_Santander/01 - CARTEIRAS/880 - MELHORIA TEAM/96 - BD WALL.E/01 - ERR/',nome,'_',Sys.Date(),'_',(gsub("[^0-9]", "", substring(Sys.time(),11,16))),'.csv'))
rm(list = ls())