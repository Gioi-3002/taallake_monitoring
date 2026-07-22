# Analisi Spazio-Temporale della siccità al Lago di Pergusa (2023-2025)
**Autore** Gioia Lo Scalzo
**Corso** Telerilevamento geo-ecologico in R

## Introduzione e obiettivi
La riserva naturale del lago di Pergusa è stata istituita al fine di salvaguardare il bacino pergusino e le relative floro-faunistiche. Attualmente ha un perimetro di 4.5km una profondità di 3.5 metri e massima di 12 non avendo immissari e emissari ha un livello legato al regime pluviometrico e all'evaporazione sopratutto estiva questo lo rende uno degli esempi più adatti a mostrare come la crisi idrica che ha colpito la Sicilia tra il 2024 e il 2025, abbia portato delle conseguenze a livello di ri
L'analisi ha dunque l'obiettivo di studiare gli effetti della grave crisi idrica che ha colpito il lago di Pergusa e tutta la Sicilia nel 2024 mettendo a confronto i dati satellitari **Sentinel-2** acquisiti nel **2023** (pre-crisi) e nel **2025** (crisi conclamata).

## Acquisizione Dati e Piattaforma
I dati satellitari utilizzati nell'analisi provengono dalla costellazione **Sentinel-2** del programma europeo Copernicus:
* **Download:** Le bande spettrali singole sono state individuate e scaricate da **Copernicus Browser** (*Copernicus Data Space Ecosystem*), selezionando scene prive di copertura nuvolosa sull'area d'interesse.
* **Bande Selezionate:** 
  * `B02` (Blu - 10m)
  * `B03` (Verde - 10m)
  * `B04` (Rosso - 10m)
  * `B08` (NIR - Infrarosso Vicino - 10m)
  * `B11` (SWIR1 - Infrarosso di Onda Corta - 20m)
  
## Metodologia ed Indici Spettrali
L'analisi è stata condotta in ambiente **R**.
### Pacchetti R Utilizzati
* **`terra`**: Gestione, calcolo dell'algebra dei raster e geodesia spaziale.
* **`imageRy`**: Telerilevamento e supporto alla visualizzazione delle immagini satellitari.
* **`ggplot2` & `patchwork`**: Rendering grafico e composizione multi-pannello delle figure.
* **`GGally`**: Matrice di correlazione multivariata tra le bande spettrali (`ggpairs`).
* **`viridis`**: Palette cromatiche ad alta accessibilità (colorblind-friendly).Dalle bande scaricate da Copernicus Browser sono stati calcolati due indici spettrali fondamentali:

### 1. NDVI (Normalized Difference Vegetation Index)
Utilizzato per valutare la salute e la densità della vegetazione:
$$\text{NDVI} = \frac{\text{NIR (Banda 8)} - \text{RED (Banda 4)}}{\text{NIR (Banda 8)} + \text{RED (Banda 4)}}$$

### 2. MNDWI (Modified Normalized Difference Water Index)
Utilizzato per identificare in modo netto le superfici d'acqua rispetto al suolo:
$$\text{MNDWI} = \frac{\text{GREEN (Banda 3)} - \text{SWIR1 (Banda 11)}}{\text{GREEN (Banda 3)} + \text{SWIR1 (Banda 11)}}$$

> **Estrazione Maschera d'Acqua:** Applicando la condizione $\text{MNDWI} > 0$, è stato possibile isolare la sola superficie occupata dal lago per entrambi gli anni.

## Visualizzazione e Analisi Esplorativa delle Bande

Prima di procedere con il calcolo degli indici spettrali, è stata condotta un'analisi esplorativa per visualizzare il comportamento spettrale del territorio e combinare le diverse lunghezze d'onda.

### 1. Visualizzazione delle bande
```R
setwd("/Users/gioialoscalzo/Desktop/Lagodipergusa/2023_pre")
dir()
#caricamento delle librerie
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
#visualizzazione delle bande con la palette Viridis
im.multiframe(2,3)
plot(b2, col=viridis(100), main="B02-blue", plg=list(shrink=1, cex=0.5))
plot(b3, col=viridis(100), main="B03-green", plg=list(shrink=1, cex=0.5))
plot(b4, col=viridis(100), main="B04-red", plg=list(shrink=1, cex=0.5))
plot(b8, col=viridis(100), main="B08-NIR",plg=list(shrink=1, cex=0.5))
plot(b11, col=viridis(100), main="B11-SWIR1",plg=list(shrink=1, cex=0.5))
```
![Bande spettrali 2023](img/visualizzazionebande2023.png)

### 2. Composizioni RGB (Natural Color vs False Color)
Tramite la combinazione delle bande della matrice raster è possibile mettere in risalto caratteristiche fisiche differenti:
* **Colori Naturali (Banda 4-Red, Banda 3-Green, Banda 2-Blue):** Riproduce la visione dell'occhio umano.
* **Falsi Colori / Infrarosso Vicino (NIR - Banda 8):** Evidenzia lo stato della vegetazione in rosso acceso e crea un fortissimo contrasto con la superficie dell'acqua.
