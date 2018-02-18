
setwd("/Users/aniladhikari/Google Drive/Thesis_documents/Chapter4_TCAP/Charts_graphs/Heatmap")  #Set WD
heatmap<-read.csv("SNPs_heatmap.csv", header=T)

library(RColorBrewer)
library(gplots)
##create a red color palette
ylred <- brewer.pal(9, "Reds")

hits_matrix<-data.matrix(heatmap)
hits=hits_matrix[,4:18]

#For assigning colors to the CHR legend
rlab= c(rep("blue4",2), rep("cornflowerblue",1), rep("blue4",7), rep("cornflowerblue",8), rep("blue4",24), rep("cornflowerblue",3))

#Defining vector for adding spaces/lines in heatmap (see function "rowsep")
row<-c(0,2,3,10,18,42,45)

#Creating vectors for legends
#names<-c("1H","2H","3H","4H","6H","UNK") #legend names
#col.legend<-c("blue","dodgerblue","blue","dodgerblue","blue","dodgerblue") #legend #colors 

dev.new(width=10, height=6) #Size of the graphics output

#Creating a heatmap
heatmap.2(hits,
           # dendrogram control
           Rowv = NULL,
           Colv=TRUE,
           dendrogram = "none",
           scale ="none",
          #image plot
          revC = identical("Colv", "Rowv"),
           na.rm=TRUE,
           col=ylred,
          # block sepration
          rowsep=row,
          sepcolor="black",
          sepwidth=c(0.0001,0.0001),
          trace="none",
          # Row/Column Labeling
          margins = c(10,6),
          RowSideColors=rlab,
          labRow = heatmap$pos,
          labCol = NULL,
          srtRow = 0,
          srtCol = 60,
          adjRow = c(0,NA),
          offsetRow = 0.00,
          offsetCol = 0.75,
          # color key + density info 
          key = TRUE,
           keysize = 1,  
           key.title = "Color key",
            key.xlab = "-log(P) value", 
            key.ylab = "No. of SNPs",
           #plot labels,
           xlab = "Association mapping panels",
           ylab = "SNP map position")

#Creating a legend          
legend("left", inset=0.0,      
       legend = names,
       col = col.legend, 
       lty= 1,             
       lwd = 4,           
       cex=.7
)