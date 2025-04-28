# 🍃 leafMeAlone

> _Helping trees ghost you one pixel at a time._

---

## ✨ Overview

**leafMeAlone** is an R package for **automated tree canopy monitoring** and **autumn phenology detection** using **satellite remote sensing data**.  
It provides tools to:

- Download and process satellite images (e.g., Sentinel-2 NDVI)
- Calculate NDVI and classify vegetation
  
 ![image](https://github.com/user-attachments/assets/23858c54-529d-41bd-982e-1d7219f5085a)
 ![image](https://github.com/user-attachments/assets/a8a56294-2409-41a1-a023-b66c594bd0bc)

- Detect tree canopy gain or loss over time
- Analyze autumn onset from NDVI timeseries
- Create interactive **leaflet maps** 🌍 and **animations** 📽️
- Generate beautiful **HTML reports** automatically

---

## 📦 Installation

You can install the development version of **leafMeAlone** from GitHub:

```r
# Install devtools if you don't have it
install.packages("devtools")

# Install leafMeAlone
devtools::install_github("MadhuraSaha02/leafMeAlone")
