library(xlsx)
library(xlsxjars)
library(rJava)
library(readxl)
options(java.parameters = "-Xss4m")
javaImport(packages = "org.appache.poi")
.jinit()
sheet <- getSheets(loadWorkbook("C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Derm_Augustus_Collagen _Inquiry_Mapped_Practice copy.xlsx"))[['Sheet0']] #all genes/proteins resulting from GO search
colGenes <- readRows(sheet, startRow = 2, endRow = 73, startColumn = 1, endColumn = 1 )
geneExpressionsWB <- loadWorkbook("C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Tester.xlsx")
geneExpressionsSheets <- getSheets(geneExpressionsWB)
geneExpressionsMain <- geneExpressionsSheets[['Sheet1']]
gEC <- readRows(geneExpressionsMain, startRow = 2 , endRow = 2 , startColumn = 0, endColumn = 1)
i <- 1
location <- 1
for(x in colGenes){ #going down the chart, x is a 6 digit gene ID
  }
  i <- i + 1
  colStats <- readColumns(sheet, startColumn = 9, endColumn = 9, startRow = i, endRow = i + 1)
for(s in colStats){ # looking at if a column has been processed yet, I actually think this will be obsolete after my current run since ALL intial processing will be done with this
  if(s == "Yes"){
    print("processed") #line will likely be deleted later, used to test 
  }else{
    for(g in gEC){
      # this searches for the gene ID within the expression level matrix, I am also able to find out wether or not it was found using this 
      location <- location + 1
      if(g == x){
        print("found")
        createSheet(geneExpressionsWB, sheetName = x)
        saveWorkbook(geneExpressionsWB,"C:/Users/samue/OneDrive/UW/Roberts Lab/Sea Star Transcriptomics/Tester.xlsx", password = NULL)
        if(i %% 2 == 0){
          rows <- createRow(geneExpressionsSheets[[x]], 1:4) # 9 rows when working with tester, 12 in real deal
          
          
        }
      }else{
        print("problematic")
      }
    }
  }
  print(s)
}
print(i)

