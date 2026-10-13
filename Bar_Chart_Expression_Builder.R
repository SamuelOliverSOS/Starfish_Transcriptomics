library(xlsx)
library(xlsxjars)
library(rJava)
library(readxl)
options(java.parameters = "-Xss4m")
javaImport(packages = "org.appache.poi")
.jinit()
GO_Results <- Pisas_Collagen_IDMAP$"Gene ID"
Countmatrix <- pisaster_gene_count_matrix_2023_1_$"gene_id"
for(x in GO_Results){
  i <- 0
  cur <- strsplit(x, ".", fixed = TRUE)
  cur <- unlist(cur)
  matched <- FALSE
  while(matched == FALSE){
    if(Countmatrix[i] == cur){
    }
  }
  
}
  
