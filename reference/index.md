# Package index

## Political

These functions return [sf](https://CRAN.R-project.org/package=sf)
objects with political boundaries.

- [`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md)
  : Database with codes and names of spanish regions

- [`esp_get_can_box()`](https://ropenspain.github.io/mapSpain/reference/esp_get_can_box.md)
  [`esp_get_can_provinces()`](https://ropenspain.github.io/mapSpain/reference/esp_get_can_box.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) lines and
  polygons for insetting the Canary Islands

- [`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/reference/esp_get_capimun.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POINT`
  of the municipalities of Spain

- [`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_ccaa.md)
  [`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/reference/esp_get_ccaa.md)
  :

  Get Autonomous Communities of Spain as
  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON` or
  `POINT`

- [`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/reference/esp_get_comarca.md)
  :

  Get 'comarcas' of Spain as
  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`

- [`esp_get_country()`](https://ropenspain.github.io/mapSpain/reference/esp_get_country.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
  representing Spain

- [`esp_get_hex_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md)
  [`esp_get_hex_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md)
  [`esp_get_grid_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md)
  [`esp_get_grid_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md)
  :

  Get a [`sf`](https://r-spatial.github.io/sf/reference/sf.html) hexbin
  or squared `POLYGON` of Spain

- [`esp_get_munic()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md)
  [`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md)
  :

  Get municipalities of Spain as
  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`

- [`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/reference/esp_get_nuts.md)
  :

  Get NUTS of Spain as
  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON` or
  `POINT`

- [`esp_get_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_prov.md)
  [`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/reference/esp_get_prov.md)
  :

  Get Provinces of Spain as
  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON` or
  `POINT`

- [`esp_get_simpl_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_simplified.md)
  [`esp_get_simpl_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_simplified.md)
  : Get a simplified map of provinces and autonomous communities of
  Spain

- [`gisco_get_nuts()`](https://ropengov.github.io/giscoR/reference/gisco_get_nuts.html)
  :

  Get GISCO NUTS
  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) polygons,
  points and lines (from giscoR)

## Natural

These functions return [sf](https://CRAN.R-project.org/package=sf)
objects with natural features.

- [`esp_get_hydrobasin()`](https://ropenspain.github.io/mapSpain/reference/esp_get_hydrobasin.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
  of the drainage basin demarcations of Spain

- [`esp_get_hypsobath()`](https://ropenspain.github.io/mapSpain/reference/esp_get_hypsobath.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
  or `LINESTRING` with hypsometry and bathymetry of Spain

- [`esp_get_rivers()`](https://ropenspain.github.io/mapSpain/reference/esp_get_rivers.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
  or `LINESTRING` of rivers, channels and other wetlands of Spain

## Infrastructures

These functions return [sf](https://CRAN.R-project.org/package=sf)
objects with man-made features.

- [`esp_get_railway()`](https://ropenspain.github.io/mapSpain/reference/esp_get_railway.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
  `LINESTRING` or `POINT` with the railways of Spain

- [`esp_get_roads()`](https://ropenspain.github.io/mapSpain/reference/esp_get_roads.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
  `LINESTRING` of the roads of Spain

## Tiles

Return static tiles or create a
[leaflet](https://CRAN.R-project.org/package=leaflet) map.

- [`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/reference/addProviderEspTiles.md)
  [`providerEspTileOptions()`](https://ropenspain.github.io/mapSpain/reference/addProviderEspTiles.md)
  :

  Include base tiles of Spanish public administrations on a
  [leaflet](https://CRAN.R-project.org/package=leaflet) map

- [`esp_getTiles()`](https://ropenspain.github.io/mapSpain/reference/esp_getTiles.md)
  : Get static tiles from public administrations of Spain

- [`esp_make_provider()`](https://ropenspain.github.io/mapSpain/reference/esp_make_provider.md)
  : Create a custom tile provider

- [`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md)
  : Database of public WMS and WMTS of Spain

- [`coord_sf()`](https://ggplot2.tidyverse.org/reference/ggsf.html)
  [`geom_sf()`](https://ggplot2.tidyverse.org/reference/ggsf.html)
  [`geom_sf_label()`](https://ggplot2.tidyverse.org/reference/ggsf.html)
  [`geom_sf_text()`](https://ggplot2.tidyverse.org/reference/ggsf.html)
  [`stat_sf()`](https://ggplot2.tidyverse.org/reference/ggsf.html) :
  Visualise sf objects (from ggplot2)

- [`geom_spatraster_rgb()`](https://dieghernan.github.io/tidyterra/reference/geom_spatraster_rgb.html)
  :

  Visualise `SpatRaster` objects as images (from tidyterra)

## Geographic grids

- [`esp_get_grid_BDN()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_BDN.md)
  [`esp_get_grid_BDN_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_BDN.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
  with the national geographic grids from BDN

- [`esp_get_grid_EEA()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_EEA.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
  of the national geographic grids from EEA

- [`esp_get_grid_ESDAC()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_ESDAC.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
  of the national geographic grids from ESDAC

- [`esp_get_grid_MTN()`](https://ropenspain.github.io/mapSpain/reference/esp_get_grid_MTN.md)
  :

  Get [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
  of the national geographic grids from IGN

## Cache management

- [`esp_clear_cache()`](https://ropenspain.github.io/mapSpain/reference/esp_clear_cache.md)
  :

  Clear your [mapSpain](https://CRAN.R-project.org/package=mapSpain)
  cache dir

- [`esp_detect_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_detect_cache_dir.md)
  :

  Detect cache dir for
  [mapSpain](https://CRAN.R-project.org/package=mapSpain)

- [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_set_cache_dir.md)
  :

  Set your [mapSpain](https://CRAN.R-project.org/package=mapSpain) cache
  dir

## Dictionary

Translation across languages and coding systems.

- [`esp_dict_region_code()`](https://ropenspain.github.io/mapSpain/reference/esp_dict.md)
  [`esp_dict_translate()`](https://ropenspain.github.io/mapSpain/reference/esp_dict.md)
  : Convert and translate subdivision names

## Datasets

These objects are datasets already included in the package.

- [`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md)
  : Database with codes and names of spanish regions

- [`esp_munic.sf`](https://ropenspain.github.io/mapSpain/reference/esp_munic.sf.md)
  :

  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object with
  all the municipalities of Spain (2019)

- [`esp_nuts.sf`](https://ropenspain.github.io/mapSpain/reference/esp_nuts.sf.md)
  :

  [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object with
  all the NUTS levels of Spain (2016)

- [`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md)
  : Database of public WMS and WMTS of Spain

- [`pobmun19`](https://ropenspain.github.io/mapSpain/reference/pobmun19.md)
  : Database with the population of Spain by municipality (2019)

## Helpers

A collection of helper functions.

- [`esp_check_access()`](https://ropenspain.github.io/mapSpain/reference/esp_check_access.md)
  : Check access to SIANE data

- [`esp_move_can()`](https://ropenspain.github.io/mapSpain/reference/esp_move_can.md)
  :

  Displace a [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
  object located in the Canary Islands

## About the package

- [`mapSpain`](https://ropenspain.github.io/mapSpain/reference/mapSpain-package.md)
  [`mapSpain-package`](https://ropenspain.github.io/mapSpain/reference/mapSpain-package.md)
  : mapSpain: Administrative Boundaries of Spain
