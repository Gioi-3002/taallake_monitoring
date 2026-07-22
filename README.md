# Analisi Spazio-Temporale della siccità al Lago di Pergusa (2023-2025)
**Autore** Gioia Lo Scalzo
**Corso** Telerilevamento geo-ecologico in R 
## Introduzione e obiettivi
La riserva naturale del lago di Pergusa è stata istituita al fine di salvaguardare il bacino pergusino e le relative floro-faunistiche. Attualmente ha un perimetro di 4.5km una profondità di 3.5 metri e massima di 12 non avendo immissari e emissari ha un livello legato al regime pluviometrico e all'evaporazione sopratutto estiva questo lo rende uno degli esempi più adatti a mostrare come la crisi idrica che ha colpito la Sicilia tra il 2024 e il 2025, abbia portato delle conseguenze a livello di ri
L'analisi ha dunque l'obiettivo di studiare gli effetti della grave crisi idrica che ha colpito il lago di Pergusa e tutta la Sicilia nel 2024 mettendo a confronto i dati satellitari **Sentinel-2** acquisiti nel **2023** (pre-crisi) e nel **2025** (crisi conclamata).
## Metodologia
L'analisi è stata condotta in ambiente **R**.
### Pacchetti R Utilizzati
* **`terra`**: Gestione, calcolo dell'algebra dei raster e geodesia spaziale.
* **`imageRy`**: Telerilevamento e supporto alla visualizzazione delle immagini satellitari.
* **`ggplot2` & `patchwork`**: Rendering grafico e composizione multi-pannello delle figure.
* **`GGally`**: Matrice di correlazione multivariata tra le bande spettrali (`ggpairs`).
* **`viridis`**: Palette cromatiche ad alta accessibilità (colorblind-friendly).
### Indici Spettrali Utilizzati 
#NDWI(normalized difference water index) mette in evidenza l'acqua liquida i pixel con valori positivi indicano la presenza del lago quelli negativi indicano il terreno asciutto 
> #MNDWI (Modified Normalized Difference Water Index) (Green-SWIR1)/(Green+SWIR1)--> (B3-B11)/(B3+B11)
> #l'indice è ancora più preciso nei laghi poco profondi o circondati da infrastrutture elimina i rumori di fondo del suolo nudo 
> #NDVI (Normalized Difference vegetation Index) l'indice di vegetazione è molto utile per vedere la ricolonizzazione del fondale man mano che il lago si ritira, alghe e piante pioniere iniziano al crescere sul fango esposto facendo schizzare l'NDVI verso l'alto dove prima c'era acqua
