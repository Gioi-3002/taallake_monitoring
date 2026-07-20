#lago di pergusa 
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
#setto la wd 
setwd("/Users/gioialoscalzo/Desktop/Lagodipergusa/2023_pre")
dir()
> #richiamare le librerie che me servono per dopo 
> library(terra)
> library(viridis)
> library(imageRy)
library(patchwork)
library(ggplot2)
#importo i file raster delle bande relativi al 21/02/23
> b2<-rast("B02_23.tiff")
> b3<-rast("B03_23.tiff")
> b4<-rast("B04_23.tiff")
> b8<-rast("B08_23.tiff")
> b11<-rast("B11_23.tiff")
#visualizzazione per i daltonici 
> im.multiframe(3,2)
> plot(b2, col=viridis(100), main="B02-blue", plg=list(shrink=1, cex=0.5))
> plot(b3, col=viridis(100), main="B03-green", plg=list(shrink=1, cex=0.5))
> plot(b4, col=viridis(100), main="B04-red", plg=list(shrink=1, cex=0.5))
> plot(b8, col=viridis(100), main="B08-NIR",plg=list(shrink=1, cex=0.5))
> plot(b11, col=viridis(100), main="B11-SWIR1",plg=list(shrink=1, cex=0.5))
#ggplot
g2<-im.ggplot(b2)
g3<-im.ggplot(b3)
g4<-im.ggplot(b4)
g8<-im.ggplot(b8)
g11<-im.ggplot(b11)
#li visualizzo tutti insieme facendo il patchwork
(g2+g3+g4)/(g8+g11)
#visualizzazione in RGB true colors, ad ogni banda assegno un valore 
1=b2 (blue)
2=b3 (green)
3=b4 (red)
4=b8 (NIR)
#creo lo stack
sentinel<-c(b2,b3,b4,b8,b11)
#multiframe
im.multiframe(1,3)
#plotto in true colors
plotRGB(sentinel, r=3, g=2, b=1, stretch="lin", main="Colori Reali (RGB 432)")
#plot false colors
plotRGB(sentinel, r=4, g=3, b=2, stretch="lin", main="Falsi Colori (RGB 843)")
#plot combinazione a falsi colori  SWIR-NIR-Rosso
plotRGB(sentinel, r=5, g=4, b=3, stretch="lin",main="Visualizzazione SWIR (Umidità del Suolo e Acqua)") 
#scatterplot che mette a confronto le bande: ogni punto rappresenta un pixel se si distribuiscono da basso a sx verso alto correlazione positiva nel caso del NIR  
pairs(sentinel)
install.packages(GGally)
library(GGally)
ggpairs(sentinel)
