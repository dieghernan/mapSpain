# Package index

## Political borders of Spain

These functions return [sf](https://CRAN.R-project.org/package=sf)
objects representing political borders.

### CartoBase ANE

Datasets from IGN / CartoBase ANE.

- [`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md)
  : City where the municipal public authorities are based - SIANE
- [`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md)
  : Autonomous Communities of Spain - SIANE
- [`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md)
  : Countries of the World - SIANE
- [`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md)
  : Municipalities of Spain - SIANE
- [`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md)
  : Provinces of Spain - SIANE
- [`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md)
  : Boundaries of Spain - SIANE
- [`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)
  : SIANE bulk download

### GISCO

Datasets from GISCO / Eurostat.

- [`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md)
  : Autonomous Communities of Spain - GISCO
- [`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md)
  : Municipalities of Spain - GISCO
- [`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md)
  : Territorial Spanish units for statistics (NUTS) dataset
- [`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md)
  : Provinces of Spain - GISCO
- [`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md)
  : Boundaries of Spain - GISCO

### Other helpers and political objects

- [`esp_get_can_box()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_can_box.md)
  [`esp_get_can_provinces()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_can_box.md)
  : Canary Islands inset box and outline

- [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md)
  :

  Displace a [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
  object located in the Canary Islands

- [`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_comarca.md)
  : 'Comarcas' of Spain

- [`esp_get_hex_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md)
  [`esp_get_hex_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md)
  [`esp_get_grid_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md)
  [`esp_get_grid_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md)
  :

  Get a [`sf`](https://r-spatial.github.io/sf/reference/sf.html) hexbin
  or squared `POLYGON` of Spain

- [`esp_get_simpl_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md)
  [`esp_get_simpl_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md)
  : Simplified map of provinces and autonomous communities of Spain

## Maps with images

Return static tiles or create an interactive
[leaflet](https://CRAN.R-project.org/package=leaflet) map.

- [`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/addProviderEspTiles.md)
  :

  Add a tile layer from Spanish public administrations on a
  [leaflet](https://CRAN.R-project.org/package=leaflet) map

- [`esp_get_tiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)
  : Get static tiles from public administrations of Spain

- [`esp_make_provider()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_make_provider.md)
  : Create a custom tile provider

- [`plotRGB(`*`<SpatRaster>`*`)`](https://rspatial.github.io/terra/reference/plotRGB.html)
  : Red-Green-Blue plot of a multi-layered SpatRaster (from terra)

- [`addProviderTiles()`](https://rstudio.github.io/leaflet/reference/addProviderTiles.html)
  [`providerTileOptions()`](https://rstudio.github.io/leaflet/reference/addProviderTiles.html)
  : Add a tile layer from a known map provider (from leaflet)

- [`geom_spatraster_rgb()`](https://dieghernan.github.io/tidyterra/reference/geom_spatraster_rgb.html)
  :

  Visualise `SpatRaster` objects as images (from tidyterra)

## Natural

These functions return [sf](https://CRAN.R-project.org/package=sf)
objects with natural features.

- [`esp_get_hydrobasin()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_hydrobasin.md)
  : River basin districts of Spain - SIANE
- [`esp_get_hypsobath()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_hypsobath.md)
  : Hypsometry and bathymetry of Spain - SIANE
- [`esp_get_rivers()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_landwater.md)
  [`esp_get_wetlands()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_landwater.md)
  : Rivers and wetlands of Spain - SIANE

## Infrastructures

These functions return [sf](https://CRAN.R-project.org/package=sf)
objects with man-made features.

- [`esp_get_railway()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_railway.md)
  [`esp_get_stations()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_railway.md)
  : Railways of Spain - SIANE
- [`esp_get_roads()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_roads.md)
  : Roads of Spain - SIANE

## Cache management

- [`esp_clear_cache()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_clear_cache.md)
  :

  Clear your [mapSpain](https://CRAN.R-project.org/package=mapSpain)
  cache dir

- [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md)
  [`esp_detect_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md)
  :

  Set your [mapSpain](https://CRAN.R-project.org/package=mapSpain) cache
  dir

## Dictionary

Translation across languages and coding systems.

- [`esp_dict_region_code()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md)
  [`esp_dict_translate()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md)
  : Convert and translate Spanish subdivision names and codes

## Datasets

Datasets included with
[mapSpain](https://CRAN.R-project.org/package=mapSpain).

- [`esp_codelist`](https://ropenspain.github.io/mapSpain/dev/reference/esp_codelist.md)
  : Database with codes and names of Spanish regions

- [`esp_nuts_2024`](https://ropenspain.github.io/mapSpain/dev/reference/esp_nuts_2024.md)
  :

  NUTS 2024 for Spain
  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object

- [`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/dev/reference/esp_tiles_providers.md)
  : Public WMS and WMTS providers for Spain

- [`pobmun25`](https://ropenspain.github.io/mapSpain/dev/reference/pobmun25.md)
  : Population of Spain by municipality (2025)

## Geographical grids

Geographical grids are agreed, defined and harmonised grid nets with
standardised location and size of grid cells.

- [`esp_get_grid_BDN()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_BDN.md)
  [`esp_get_grid_BDN_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_BDN.md)
  : National geographic grids from BDN (Nature Data Bank)
- [`esp_get_grid_ESDAC()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_ESDAC.md)
  : National geographic grids from the European Soil Data Centre (ESDAC)
- [`esp_get_grid_MTN()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_MTN.md)
  : National geographic grids from IGN MTN ((Mapa Topografico Nacional)

## About the package

- [`mapSpain`](https://ropenspain.github.io/mapSpain/dev/reference/mapSpain-package.md)
  [`mapSpain-package`](https://ropenspain.github.io/mapSpain/dev/reference/mapSpain-package.md)
  : mapSpain: Administrative Boundaries of Spain
