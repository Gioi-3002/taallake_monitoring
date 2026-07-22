 
setwd("/Users/gioialoscalzo/Desktop/Lagodipergusa/2023_pre")
dir()
#librerie usate
library(terra)
library(viridis)
library(imageRy)
library(patchwork)
library(ggplot2)

#importazione file raster
b2<-rast("B02_23.tiff")
b3<-rast("B03_23.tiff")
b4<-rast("B04_23.tiff")
b8<-rast("B08_23.tiff")
b11<-rast("B11_23.tiff")

#visualizzazione delle bande
im.multiframe(2,3)
plot(b2, col=viridis(100), main="B02-blue", plg=list(shrink=1, cex=0.5))
plot(b3, col=viridis(100), main="B03-green", plg=list(shrink=1, cex=0.5))
plot(b4, col=viridis(100), main="B04-red", plg=list(shrink=1, cex=0.5))
plot(b8, col=viridis(100), main="B08-NIR",plg=list(shrink=1, cex=0.5))
plot(b11, col=viridis(100), main="B11-SWIR1",plg=list(shrink=1, cex=0.5))

#ggplot
g2<-im.ggplot(b2)
g3<-im.ggplot(b3)
g4<-im.ggplot(b4)
g8<-im.ggplot(b8)
g11<-im.ggplot(b11)

#patchwork
(g2+g3+g4)/(g8+g11)
sentinel<-c(b2,b3,b4,b8,b11)

#visualizzazione RGB
im.multiframe(1,3)
#true colors
plotRGB(sentinel, r=3, g=2, b=1, stretch="lin", main="Colori Reali (RGB 432) 2023")
#false colors
plotRGB(sentinel, r=4, g=3, b=2, stretch="lin", main="Falsi Colori (RGB 843) 2023")
#combinazione a falsi colori  SWIR-NIR-Rosso
plotRGB(sentinel, r=5, g=4, b=3, stretch="lin",main="Visualizzazione SWIR (Umidità del Suolo e Acqua) 2023") 

#funzione pairs
pairs(sentinel)
library(GGally)
ggpairs(sentinel)
dev.off()
#NDVI 2023
ndvi2023<-(b8-b4)/(b8+b4)
tavolozza_ndvi<-colorRampPalette(c("blue", "brown", "yellow", "darkgreen"))
im.multiframe(1,2)
plot(ndvi2023, main="NDVI - Indice di Vegetazione 2023", col=tavolozza_ndvi(100),plg = list(shrink = 0.8, cex = 0.7))
hist(ndvi2023, main = "Distribuzione dei valori NDVI 2023",xlab = "Indice NDVI",ylab = "Numero di Pixel",col = "darkgreen",breaks = 50)
summary(ndvi2023)

#MNDWI 2023
dev.off()
mndwi2023<-(b3-b11)/(b3+b11)
tavolozza_mndwi2023 <- colorRampPalette(c("brown", "yellow", "cyan", "blue"))
plot(mndwi2023, main = "MNDWI - Indice Acqua Modificato 2023", col=tavolozza_mndwi2023(100))
#estratto specchio d'acqua 2023
acqua_maschera <- ifel(mndwi2023 > 0, 1, NA)
plot(acqua_maschera,main = "Specchio d'Acqua Estratto (MNDWI > 0)2023",col = "blue")
dev.off()
#area del lago 2023
area_info <- expanse(acqua_maschera, unit = "m")
area_mq <- area_info$area
area_ettari <- area_mq / 10000
area_km2 <- area_mq / 1000000
cat("Area dello specchio d'acqua:\n")
cat("- Metri quadri (m²):", round(area_mq, 2), "\n")
cat("- Ettari (ha):", round(area_ettari, 2), "\n")
cat("- Km quadrati (km²):", round(area_km2, 4), "\n")
dev.off()

#lago di pergusa 2025
setwd("/Users/gioialoscalzo/Desktop/Lagodipergusa/2025_post")
dir()
#librerie usate
library(terra)
library(viridis)
library(imageRy)
library(patchwork)
library(ggplot2)

#importazione file raster
B2<-rast("B02_25.tiff")
B3<-rast("B03_25.tiff")
B4<-rast("B04_25.tiff")
B8<-rast("B08_25.tiff")
B11<-rast("B11_25.tiff")

#visualizzazione delle bande
dev.off()
im.multiframe(2,3)
plot(B2, col=viridis(100), main="B02-blue", plg=list(shrink=1, cex=0.2))
plot(B3, col=viridis(100), main="B03-green", plg=list(shrink=1, cex=0.2))
plot(B4, col=viridis(100), main="B04-red", plg=list(shrink=1, cex=0.2))
plot(B8, col=viridis(100), main="B08-NIR",plg=list(shrink=1, cex=0.2))
plot(B11, col=viridis(100), main="B11-SWIR1",plg=list(shrink=1, cex=0.2))

#ggplot
G2<-im.ggplot(B2)
G3<-im.ggplot(B3)
G4<-im.ggplot(B4)
G8<-im.ggplot(B8)
G11<-im.ggplot(B11)

#patchwork
(G2+G3+G4)/(G8+G11)

#visualizzazione RGB
sentinel2<-c(B2,B3,B4,B8,B11)
im.multiframe(1,3)
#true colors
plotRGB(sentinel2, r=3, g=2, b=1, stretch="lin", main="Colori Reali (RGB 432) 2025")
#false colors
plotRGB(sentinel2, r=4, g=3, b=2, stretch="lin", main="Falsi Colori (RGB 843) 2025")
#combinazione a falsi colori  SWIR-NIR-Rosso
plotRGB(sentinel2, r=5, g=4, b=3, stretch="lin",main="Visualizzazione SWIR (Umidità del Suolo e Acqua) 2025")

#confronto le bande: ogni punto rappresenta un pixel se si distribuiscono da basso a sx verso alto correlazione positiva nel caso del NIR  
pairs(sentinel2)
library(GGally)
ggpairs(sentinel2)

#NDVI 2025
dev.off()
im.multiframe(1,2)
ndvi2025<-(B8-B4)/(B8+B4)
tavolozza_ndvi<-colorRampPalette(c("blue", "brown", "yellow", "darkgreen"))
plot(ndvi2025, main="NDVI - Indice di Vegetazione 2025", col=tavolozza_ndvi(100), plg = list(shrink = 0.8, cex = 0.7))
#calcolo distribuzione
hist(ndvi2025,main = "Distribuzione dei valori NDVI 2025",xlab = "Indice NDVI",ylab = "Numero di Pixel",col = "darkgreen",breaks = 50)

#MNDWI 2025
dev.off()
mndwi2025<-(B3-B11)/(B3+B11)
tavolozza_mndwi2025 <- colorRampPalette(c("brown", "yellow", "cyan", "blue"))
plot(mndwi2025, main = "MNDWI - Indice Acqua Modificato 2025", col=tavolozza_mndwi2023(100))

#estratto specchio dell'acqua 2025
acqua_maschera2 <- ifel(mndwi2025 > 0, 1, NA)
plot(acqua_maschera2,main = "Specchio d'Acqua Estratto (MNDWI > 0) 2025",col = "blue")

#calcolo area del lago 2025
area_info <- expanse(acqua_maschera, unit = "m")
area_mq <- area_info$area
area_ettari <- area_mq / 10000
area_km2 <- area_mq / 1000000
cat("Area dello specchio d'acqua:\n")
cat("- Metri quadri (m²):", round(area_mq, 2), "\n")
cat("- Ettari (ha):", round(area_ettari, 2), "\n")
dev.off()

#comparazione 2023-2025
#variazione dell'NDVI 2023-25
ndvi2023_allineato<-resample(ndvi2023, ndvi2025)
ndvi_diff<-ndvi2025-ndvi2023_allineato
tavolozza_diff<- colorRampPalette(c("red", "yellow", "white", "lightgreen", "darkgreen"))
plot(ndvi_diff,main = "Variazione dell'NDVI dal 2023 al 2025",col = tavolozza_diff(100))

#variazione dell'MNDWI 2023-2025
mndwi2023_allineato<-resample(mndwi2023, mndwi2025)
mndwi_diff<-mndwi2025-mndwi2023_allineato
plot(mndwi_diff,main = "Variazione dell'MNDWI dal 2023 al 2025",col = tavolozza_diff(100))
