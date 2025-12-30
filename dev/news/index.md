# Changelog

## mapSpain (development version)

This major release introduces a full overhaul of the codebase and test
suite. Requests now use **httr2**, and cached files are reorganized into
topic-based subfolders for easier management.

> Because of internal changes, **existing caches are not compatible**
> with this release and must be rebuilt.

We have transitioned from
[`rappdirs::user_config_dir()`](https://rappdirs.r-lib.org/reference/user_data_dir.html)
to [`tools::R_user_dir()`](https://rdrr.io/r/tools/userdir.html) for
managing your persistent cache directory. If you are a heavy
**mapSpain** user and already have a cache directory in place, you’ll
receive a one-time friendly message informing you about this migration.
Consider it a warm welcome to **mapSpain** 1.0.0 😉.

The package now requires **R ≥ 4.1**, and dependency updates improve
both performance and maintainability. All functions return tidy objects
(tibbles or `sf` objects with tibble data).

Several new functions and arguments have been added, some functions
renamed, and some others deprecated. All bundled datasets have been
updated to their latest versions.

### Breaking changes

- Minimum required R version is now **4.1.0**.
- Removed dependency on **slippymath**
  ([\#126](https://github.com/rOpenSpain/mapSpain/issues/126)).
- `providerEspTileOptions()` has been removed; use
  [`leaflet::providerTileOptions()`](https://rstudio.github.io/leaflet/reference/addProviderTiles.html)
  instead.
- Removed dataset `?esp_munic.sf`.
- Removed dataset `?leaflet.providersESP.df` (superseded in mapSpain
  **v0.8.0**).
- Removed dataset `?pobmun19`; it has been replaced by
  [`?pobmun25`](https://ropenspain.github.io/mapSpain/dev/reference/pobmun25.md).
- [`esp_get_grid_EEA()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_EEA.md)
  is deprecated and defunct, as the source file is no longer available.

### Deprecations and new function names

- [`esp_getTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)
  has been renamed to
  [`esp_get_tiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)
  (old name still works).
- [`esp_get_country()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md)
  has been renamed to
  [`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md)
  (old name still works).
- In
  [`esp_get_rivers()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_landwater.md):
  - Arguments `resolution` and `spatialtype` are deprecated.
  - Wetlands support has been moved to the new
    [`esp_get_wetlands()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_landwater.md)
    function.

### New features

- Added
  [`esp_get_stations()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_railway.md),
  replacing `esp_get_railway(..., spatialtype = "point")`.
- Added
  [`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)
  to download all SIANE datasets to a specified `cache_dir` in a single
  step.
- Added
  [`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md)
  to retrieve all countries available in SIANE at a given date.
- Added
  [`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
  analogous to
  [`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md),
  using SIANE data.
- Added dataset
  [`?esp_nuts_2024`](https://ropenspain.github.io/mapSpain/dev/reference/esp_nuts_2024.md),
  replacing `?esp_nuts.sf`.
- [`esp_get_rivers()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_landwater.md)
  gains a new `moveCAN` argument.

## mapSpain 0.10.0

CRAN release: 2024-12-15

- Fix a bug on
  [`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md)
  when selecting columns
  [\#115](https://github.com/rOpenSpain/mapSpain/issues/115).
- New argument `type` in
  [`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_comarca.md).
  Now it is possible to extract different types of comarcas: Official
  (IGN), statistical (INE), agrarian or livestock comarcas (MAPA).

## mapSpain 0.9.2

CRAN release: 2024-08-26

- **SIANE 2024 Update**: Adapt functions to new databases.
- Improve dictionaries:
  [`esp_dict_region_code()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md)
  and
  [`esp_dict_translate()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md).

## mapSpain 0.9.1

CRAN release: 2024-06-10

- Update actions and docs.

## mapSpain 0.9.0

CRAN release: 2024-01-23

- Changes on how to handle modifications on Canary Islands objects
  ([\#101](https://github.com/rOpenSpain/mapSpain/issues/101)):
  - Add a helper function for displace stand-alone `sf` objects in
    Canary Islands:
    [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md).
  - [`esp_move_can()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_move_can.md)
    is used internally on all functions.
- Add a new function to show the current cache directory:
  [`esp_detect_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).
- `mapSpain::layer_spatraster()` removed (was deprecated in **mapSpain**
  0.6.2).

## mapSpain 0.8.0

CRAN release: 2023-07-12

- Improve download of NUTS data from **giscoR**.
- Upgrade `esp_tiles_providers` to
  <https://dieghernan.github.io/leaflet-providersESP/> v1.3.3. New
  providers included:
  - `IDErioja.Base`
  - `IDErioja.Relieve`
  - `IDErioja.Claro`
  - `IDErioja.Oscuro`
- [`esp_getTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)
  now supports non-OGC compliant WMTS providers, such as Stamen or
  OpenStreetMaps (see examples).

## mapSpain 0.7.0

CRAN release: 2022-12-22

- Upgrade `leaflet.providersESP.df` to
  <https://dieghernan.github.io/leaflet-providersESP/> v1.3.2.
- Changes on how to package manages tiles providers:
  - `leaflet.providersESP.df` is superseded in favor of
    `esp_tiles_providers`.
  - You can use a custom url with the `type` argument in
    [`esp_getTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)
    ([\#88](https://github.com/rOpenSpain/mapSpain/issues/88)).
  - Add new function
    [`esp_make_provider()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_make_provider.md)
    that helps to create custom providers.

## mapSpain 0.6.2

CRAN release: 2022-08-13

- Now `moveCAN` is a explicit argument in the relevant functions.
- Deprecate `layer_spatraster().` Use
  [`tidyterra::geom_spatraster_rgb()`](https://dieghernan.github.io/tidyterra/reference/geom_spatraster_rgb.html)
  instead.
- Fix geometries on
  [`esp_get_hex_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md)
  and
  [`esp_get_hex_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md).
- Add new function to get comarcas from INE:
  [`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_comarca.md).
- Add new functions to get simplified maps from INE:
  - [`esp_get_simpl_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md).
  - [`esp_get_simpl_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md).

## mapSpain 0.6.1

CRAN release: 2022-02-25

- HOTFIX: Bug on
  [`esp_getTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)
  when `mask = TRUE`.

## mapSpain 0.6.0

CRAN release: 2022-02-18

- Upgrade `leaflet.providersESP.df` to
  <https://dieghernan.github.io/leaflet-providersESP/> v1.3.0. New
  providers:
  - `Catastro.BuildingPart`
  - `Catastro.AdministrativeBoundary`
  - `Catastro.AdministrativeUnit`
- Add new param `options` to
  [`esp_getTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md).
- Improve regex search on municipalities: Now the casing of the word is
  ignored.

## mapSpain 0.5.0

CRAN release: 2022-01-25

- Rebuild coding database to avoid errors due to encoding.
- Fix translations on Galician.
- New grid functions
  ([\#61](https://github.com/rOpenSpain/mapSpain/issues/61)):
  - [`esp_get_grid_MTN()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_MTN.md)
  - [`esp_get_grid_BDN()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_BDN.md)
  - [`esp_get_grid_EEA()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_EEA.md)
  - [`esp_get_grid_ESDAC()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_ESDAC.md)

## mapSpain 0.4.0

CRAN release: 2021-10-14

- Switch from **raster** to **terra**.
- Clean up dependencies. Imagery packages moved to ‘Suggests’.
- Add `layer_spatraster()`.
- Move examples to **ggplot2**.

## mapSpain 0.3.1

CRAN release: 2021-09-10

- Fix an error on **CRAN** related with the cache folder
  [\#52](https://github.com/rOpenSpain/mapSpain/issues/52):
  - Add
    [`mapSpain::esp_clear_cache()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_clear_cache.md)
- Update docs with `@family` tag.

## mapSpain 0.3.0

CRAN release: 2021-09-01

- Caching improvements: new function
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md)
  based on
  [`rappdirs::user_cache_dir()`](https://rappdirs.r-lib.org/reference/user_cache_dir.html).
  Now the cache_dir path is stored and it is not necessary to set it up
  again on a new session.
- Add a new argument `zoommin` on
  [`esp_getTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md).
- New tests with **testthat**.
- Update on docs. New examples
- Precompute vignette.

## mapSpain 0.2.3

CRAN release: 2021-04-25

- Move minimum version of **giscoR** to v0.2.4
- Fix typos on
  [`esp_dict_translate()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md)
  ([\#36](https://github.com/rOpenSpain/mapSpain/issues/36)).
- Not run examples on tiles, as the server sometimes doesn’t respond.
- Re factor `sysdata.rda`.
- **CRAN** fixes:
  - Removed broken link on
    [`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/addProviderEspTiles.md).
  - Vignette removed (**CRAN** warning).
- Now the `cache` directory is created recursively.

## mapSpain 0.2.2

CRAN release: 2021-04-17

- Migrate examples, vignettes and README to **tmap**.
- Add vignette to package.
- [`esp_dict_region_code()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_dict.md)
  works with mixed casings (e.g:
  `esp_dict_region_code("aLbacEte", destination = "cpro")`).

## mapSpain 0.2.1

CRAN release: 2021-03-19

- **QUICKFIX**: Fix a typo on documentation: `cache_dir` should be set
  as `options(mapSpain_cache_dir = "path/to/dir")`.

## mapSpain 0.2.0

CRAN release: 2021-02-25

- Fix DOI <https://doi.org/10.5281/zenodo.4318024>
- Documentation ported to **roxygen2**.
- Include CartoBase ANE data
  <https://github.com/rOpenSpain/mapSpain/tree/sianedata>:
  - [`mapSpain::esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md)
  - [`mapSpain::esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md)
  - [`mapSpain::esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md)
  - [`mapSpain::esp_get_hypsobath()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_hypsobath.md)
  - [`mapSpain::esp_get_rivers()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_landwater.md)
  - [`mapSpain::esp_get_hydrobasin()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_hydrobasin.md)
  - [`mapSpain::esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md)
  - [`mapSpain::esp_get_roads()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_roads.md)
  - [`mapSpain::esp_get_railway()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_railway.md)
- Mute warnings from **rgdal**.

## mapSpain 0.1.2

CRAN release: 2021-01-05

- Fix annoying warning if **sf** was not loaded first.
- Include new `poly` option on
  [`mapSpain::esp_get_can_box()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_can_box.md).
- New grids created with `geogrid::calculate_grid()`.
- Add more years on
  [`mapSpain::esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md).
- Move to rOpenSpain organization.

## mapSpain 0.1.1

CRAN release: 2020-11-30

- Fix **CRAN** submission.
- Added
  [`mapSpain::esp_get_grid_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md)
  and
  [`mapSpain::esp_get_grid_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md).

## mapSpain 0.1.0

- Initial release.
