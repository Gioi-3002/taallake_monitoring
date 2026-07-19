# il lago di taal 
#prima cosa che faccio è cercare le immagini del lago prima del gennaio 2020 e dopo il gennaio 2020 anche al momento dell'eruzione sarebbe fico

#Le bande da scaricare B2(blue) B3(green) B4(red) B8 (NIR) B11 e B12 SCL(per mascherare le nuvole)  le scarico di qualche mese prima del 2020 e qualche mese dopo 

#installo librerie
install.packages("terra")
library(terra)          # Per la gestione e l'analisi di dati raster (immagini multispettrali)
library(imageRy)        # Per l'elaborazione e la visualizzazione di immagini multispettrali
library(viridis)        # Per utilizzare colormap accessibili e scientificamente accurate
library(ggplot2)        # Per la creazione di grafici avanzati e personalizzati
library(patchwork)      # Per combinare più grafici in un'unica visualizzazione
#uso library terra
library(terra)
#setto la wd per lavorare con i dati di giugno 06/19 pre eruzione 
setwd("/Users/gioialoscalzo/Desktop/taallake/TL_06_19")
#importo le bande come oggetti usando funzione rast
b2<-rast("B02_19.tiff")
b3<-rast("B02_19.tiff")
b4<-rast("B04_19.tiff")
b8<-rast("B08_19.tiff")
b11<-rast("B11_19.tiff")
b12<-rast("B12_19.tiff")
#visualizzazione
#plotto tutte le bande separatamente in colorazione viridis 
par(mfrow=c(2,3))
plot(B02, col=viridis(100), main="B02-Blue")
plot(B03, col=viridis(100), main="B03 - Green")
plot(B04, col=viridis(100), main="B04 - Red")
plot(B08, col=viridis(100), main="B08 - NIR")
plot(B11, col=viridis(100), main="B11 - SWIR1")
plot(B12, col=viridis(100), main="B12 - SWIR2")
