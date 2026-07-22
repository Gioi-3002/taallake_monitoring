# Analisi Spazio-Temporale della siccità al Lago di Pergusa (2023-2025)
**Autore** Gioia Lo Scalzo
**Corso** Telerilevamento geo-ecologico in R

## Introduzione e obiettivi
La riserva naturale del lago di Pergusa è stata istituita al fine di salvaguardare il bacino pergusino e le relative floro-faunistiche. Attualmente ha un perimetro di 4.5km una profondità di 3.5 metri e massima di 12 non avendo immissari e emissari ha un livello legato al regime pluviometrico e all'evaporazione sopratutto estiva questo lo rende uno degli esempi più adatti a mostrare come la crisi idrica che ha colpito la Sicilia tra il 2024 e il 2025, abbia portato delle conseguenze a livello di ri
L'analisi ha dunque l'obiettivo di studiare gli effetti della grave crisi idrica che ha colpito il lago di Pergusa e tutta la Sicilia nel 2024 mettendo a confronto i dati satellitari **Sentinel-2** acquisiti nel **2023** (pre-crisi) e nel **2025** (crisi conclamata).
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

