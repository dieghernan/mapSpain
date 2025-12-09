# Working with imagery

**mapSpain** provides a powerful interface for working with imagery.
**mapSpain** can download static files as `.png` or `.jpeg` files
(depending on the Web Map Service) and use them along your shapefiles.

**mapSpain** also includes a plugin for **R**
[leaflet](https://rstudio.github.io/leaflet/) package, that allows you
to include several basemaps on your interactive maps.

The services are implemented via the leaflet plugin
[leaflet-providersESP](https://ropenspain.github.io/mapSpain/articles/dieghernan.github.io/leaflet-providersESP/).
You can check a display of each provider on the previous link.

## Static tiles

An example of how you can include several tiles to create a static map.
We focus here on layer provided by La Rioja’s [Infraestructura de Datos
Espaciales (IDERioja)](https://www.iderioja.larioja.org/).

**When working with imagery, it is important to set `moveCAN = FALSE`,
otherwise the images for the Canary Islands won’t be accurate.**

``` r
library(mapSpain)
library(sf)
library(ggplot2)
library(tidyterra)

# Logroño

lgn_borders <- esp_get_munic_siane(munic = "Logroño")

# Convert to Mercator (EPSG:3857) as a general advice when working with tiles
lgn_borders <- st_transform(lgn_borders, 3857)

tile_lgn <- esp_getTiles(lgn_borders, "IDErioja", bbox_expand = 0.5)

ggplot(lgn_borders) +
  geom_spatraster_rgb(data = tile_lgn) +
  geom_sf(fill = NA, linewidth = 2, color = "blue")
```

![Map of the limits of city of Logroño using a tile as a
basemap](working_imagery_files/figure-html/static1-1.png)

### Alpha value on tiles

Some tiles could be loaded with or without an alpha value, that controls
the transparency of the object:

``` r
madrid <- esp_get_ccaa("Madrid", epsg = 3857)

# Example without transparency

basemap <- esp_getTiles(madrid, "IDErioja.Claro",
  zoommin = 1,
  crop = TRUE, bbox_expand = 0
)
tile_opaque <- esp_getTiles(madrid, "RedTransporte.Carreteras",
  transparent = FALSE, crop = TRUE, bbox_expand = 0
)

ggplot() +
  geom_spatraster_rgb(data = basemap) +
  geom_spatraster_rgb(data = tile_opaque) +
  theme_void()
```

![Map of the roads of Autonomous Communities surrouding
Madrid](working_imagery_files/figure-html/static2-1.png)

Now let’s check the same code using the `tranparent = TRUE` option:

``` r
# Example with transparency

tile_alpha <- esp_getTiles(madrid, "RedTransporte.Carreteras",
  transparent = TRUE, crop = TRUE, bbox_expand = 0
)

# Same code than above for plotting
ggplot() +
  geom_spatraster_rgb(data = basemap) +
  geom_spatraster_rgb(data = tile_alpha) +
  theme_void()
```

![Example on how to use alpha value for combining different types of
basemaps.](working_imagery_files/figure-html/static_transp-1.png)

Now the two tiles overlaps with the desired alpha value.

### Masking tiles

Another nice feature is the ability of masking the tiles, so more
advanced maps can be plotted:

``` r
rioja <- esp_get_prov("La Rioja", epsg = 3857)

basemap <- esp_getTiles(rioja, "PNOA", bbox_expand = 0.1, zoommin = 1)

masked <- esp_getTiles(rioja, "IDErioja", mask = TRUE, zoommin = 1)

ggplot() +
  geom_spatraster_rgb(data = basemap, maxcell = 10e6) +
  geom_spatraster_rgb(data = masked, maxcell = 10e6)
```

![Example of combining types of tiles by masking to a
shapefile.](working_imagery_files/figure-html/static3-1.png)

## Dynamic maps with Leaflet

**mapSpain** provides a plugin to be used with the **leaflet** package.
Here you can find some quick examples:

### Earthquakes in Tenerife (last year)

``` r
library(leaflet)

tenerife_leaf <- esp_get_nuts(
  region = "Tenerife", epsg = 4326,
  moveCAN = FALSE
)


bbox <- as.double(round(st_bbox(tenerife_leaf) + c(-1, -1, 1, 1), 2))

# Start leaflet
m <- leaflet(tenerife_leaf,
  elementId = "tenerife-earthquakes",
  width = "100%", height = "60vh",
  options = leafletOptions(minZoom = 9, maxZoom = 18)
)

# Add layers
m <- m %>%
  addProviderEspTiles("IDErioja.Relieve") %>%
  addPolygons(color = NA, fillColor = "red", group = "Polygon") %>%
  addProviderEspTiles("Geofisica.Terremotos365dias",
    group = "Earthquakes"
  )

# Add additional options
m %>%
  addLayersControl(
    overlayGroups = c("Polygon", "Earthquakes"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  setMaxBounds(bbox[1], bbox[2], bbox[3], bbox[4])
```

### Population density in Spain

A map showing the population density of Spain as of 2019:

``` r
munic <- esp_get_munic_siane(
  year = 2019,
  epsg = 4326,
  moveCAN = FALSE,
  rawcols = TRUE
)

# Get area in km2 from siane munic
# Already on the shapefile

munic$area_km2 <- munic$st_area_sh * 10000

# Get population

pop <- mapSpain::pobmun19

# Paste
munic_pop <- merge(munic, pop[, c("cmun", "cpro", "pob19")],
  by = c("cmun", "cpro"),
  all.x = TRUE
)

munic_pop$dens <- munic_pop$pob19 / munic_pop$area_km2
munic_pop$dens_label <- prettyNum(round(munic_pop$dens, 2),
  big.mark = ".",
  decimal.mark = ","
)

# Create leaflet
bins <- c(0, 10, 25, 100, 200, 500, 1000, 5000, 10000, Inf)


pal <- colorBin("inferno", domain = munic_pop$dens, bins = bins, reverse = TRUE)

labels <- sprintf(
  "<strong>%s</strong><br/><em>%s</em><br/>%s pers. / km<sup>2</sup>",
  munic_pop$rotulo,
  munic_pop$ine.prov.name,
  munic_pop$dens_label
) %>% lapply(htmltools::HTML)


leaflet(elementId = "SpainDemo", width = "100%", height = "60vh") %>%
  setView(lng = -3.684444, lat = 40.308611, zoom = 5) %>%
  addProviderEspTiles("IDErioja") %>%
  addPolygons(
    data = munic_pop,
    fillColor = ~ pal(dens),
    fillOpacity = 0.6,
    color = "#44444",
    weight = 0.5,
    smoothFactor = .1,
    opacity = 1,
    highlightOptions = highlightOptions(
      color = "white",
      weight = 1,
      bringToFront = TRUE
    ),
    popup = labels
  ) %>%
  addLegend(
    pal = pal, values = bins, opacity = 0.7,
    title = paste0(
      "<small>Pop. Density km<sup>2</sup></small><br><small>",
      "(2019)</small>"
    ),
    position = "bottomright"
  )
```

## Providers available

The list `esp_tiles_providers` includes the data of the available
providers you can use on functions described above. This list includes
all the parameters needed to replicate the API request. See the static
url of each provider:

## Session info

Details

    #> ─ Session info ───────────────────────────────────────────────────────────────
    #>  setting  value
    #>  version  R version 4.5.2 (2025-10-31 ucrt)
    #>  os       Windows Server 2022 x64 (build 26100)
    #>  system   x86_64, mingw32
    #>  ui       RTerm
    #>  language en
    #>  collate  English_United States.utf8
    #>  ctype    English_United States.utf8
    #>  tz       UTC
    #>  date     2025-12-09
    #>  pandoc   3.1.11 @ C:/HOSTED~1/windows/pandoc/31F387~1.11/x64/PANDOC~1.11/ (via rmarkdown)
    #>  quarto   NA
    #> 
    #> ─ Packages ───────────────────────────────────────────────────────────────────
    #>  package      * version     date (UTC) lib source
    #>  bslib          0.9.0       2025-01-30 [1] RSPM
    #>  cachem         1.1.0       2024-05-16 [1] RSPM
    #>  class          7.3-23      2025-01-01 [3] CRAN (R 4.5.2)
    #>  classInt       0.4-11      2025-01-08 [1] RSPM
    #>  cli            3.6.5       2025-04-23 [1] RSPM
    #>  codetools      0.2-20      2024-03-31 [3] CRAN (R 4.5.2)
    #>  countrycode    1.6.1       2025-03-31 [1] RSPM
    #>  crosstalk      1.2.2       2025-08-26 [1] RSPM
    #>  DBI            1.2.3       2024-06-02 [1] RSPM
    #>  desc           1.4.3       2023-12-10 [1] RSPM
    #>  digest         0.6.39      2025-11-19 [1] RSPM
    #>  dplyr          1.1.4       2023-11-17 [1] RSPM
    #>  e1071          1.7-16      2024-09-16 [1] RSPM
    #>  evaluate       1.0.5       2025-08-27 [1] RSPM
    #>  farver         2.1.2       2024-05-13 [1] RSPM
    #>  fastmap        1.2.0       2024-05-15 [1] RSPM
    #>  fs             1.6.6       2025-04-12 [1] RSPM
    #>  generics       0.1.4       2025-05-09 [1] RSPM
    #>  geojsonsf      2.0.5       2025-11-26 [1] CRAN (R 4.5.2)
    #>  ggplot2      * 4.0.1       2025-11-14 [1] RSPM
    #>  giscoR         0.6.1       2025-01-27 [1] RSPM
    #>  glue           1.8.0       2024-09-30 [1] RSPM
    #>  gtable         0.3.6       2024-10-25 [1] RSPM
    #>  htmltools      0.5.9       2025-12-04 [1] RSPM
    #>  htmlwidgets    1.6.4       2023-12-06 [1] RSPM
    #>  jquerylib      0.1.4       2021-04-26 [1] RSPM
    #>  jsonlite       2.0.0       2025-03-27 [1] RSPM
    #>  KernSmooth     2.23-26     2025-01-01 [3] CRAN (R 4.5.2)
    #>  knitr          1.50        2025-03-16 [1] RSPM
    #>  leaflet      * 2.2.3       2025-09-04 [1] RSPM
    #>  lifecycle      1.0.4       2023-11-07 [1] RSPM
    #>  magrittr       2.0.4       2025-09-12 [1] RSPM
    #>  mapSpain     * 0.10.0.9000 2025-12-09 [1] local
    #>  pillar         1.11.1      2025-09-17 [1] RSPM
    #>  pkgconfig      2.0.3       2019-09-22 [1] RSPM
    #>  pkgdown        2.2.0       2025-11-06 [1] any (@2.2.0)
    #>  png            0.1-8       2022-11-29 [1] RSPM
    #>  proxy          0.4-27      2022-06-09 [1] RSPM
    #>  purrr          1.2.0       2025-11-04 [1] RSPM
    #>  R.cache        0.17.0      2025-05-02 [1] RSPM
    #>  R.methodsS3    1.8.2       2022-06-13 [1] RSPM
    #>  R.oo           1.27.1      2025-05-02 [1] RSPM
    #>  R.utils        2.13.0      2025-02-24 [1] RSPM
    #>  R6             2.6.1       2025-02-15 [1] RSPM
    #>  ragg           1.5.0       2025-09-02 [1] RSPM
    #>  RColorBrewer   1.1-3       2022-04-03 [1] RSPM
    #>  Rcpp           1.1.0       2025-07-02 [1] CRAN (R 4.5.2)
    #>  reactable    * 0.4.5       2025-12-01 [1] RSPM
    #>  reactR         0.6.1       2024-09-14 [1] RSPM
    #>  rlang          1.1.6       2025-04-11 [1] RSPM
    #>  rmarkdown      2.30        2025-09-28 [1] RSPM
    #>  S7             0.2.1       2025-11-14 [1] RSPM
    #>  sass           0.4.10      2025-04-11 [1] RSPM
    #>  scales         1.4.0       2025-04-24 [1] RSPM
    #>  sessioninfo  * 1.2.3       2025-02-05 [1] RSPM
    #>  sf           * 1.0-23      2025-11-28 [1] CRAN (R 4.5.2)
    #>  styler         1.11.0      2025-10-13 [1] RSPM
    #>  systemfonts    1.3.1       2025-10-01 [1] RSPM
    #>  terra          1.8-86      2025-11-28 [1] CRAN (R 4.5.2)
    #>  textshaping    1.0.4       2025-10-10 [1] RSPM
    #>  tibble         3.3.0       2025-06-08 [1] RSPM
    #>  tidyr          1.3.1       2024-01-24 [1] RSPM
    #>  tidyselect     1.2.1       2024-03-11 [1] RSPM
    #>  tidyterra    * 0.7.2       2025-04-14 [1] RSPM
    #>  units          1.0-0       2025-10-09 [1] CRAN (R 4.5.2)
    #>  vctrs          0.6.5       2023-12-01 [1] RSPM
    #>  viridisLite    0.4.2       2023-05-02 [1] RSPM
    #>  withr          3.0.2       2024-10-28 [1] RSPM
    #>  xfun           0.54        2025-10-30 [1] RSPM
    #>  yaml           2.3.11      2025-11-28 [1] RSPM
    #> 
    #>  [1] D:/a/_temp/Library
    #>  [2] C:/R/site-library
    #>  [3] C:/R/library
    #>  * ── Packages attached to the search path.
    #> 
    #> ──────────────────────────────────────────────────────────────────────────────
