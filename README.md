# 🍃 leafMeAlone

> _Helping trees ghost you one pixel at a time._

---

## ✨ Overview

**leafMeAlone** is an R package for **automated tree canopy monitoring** and **autumn phenology detection** using **satellite remote sensing data**.  
It provides tools to:

- Download and process satellite images (e.g., Sentinel-2 NDVI)
- Calculate NDVI and classify vegetation
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
devtools::install_github("yourgithubusername/leafMeAlone")
