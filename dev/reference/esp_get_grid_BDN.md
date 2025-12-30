# National geographic grids from BDN (Nature Data Bank)

Loads a [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
`POLYGON` object with the geographic grids of Spain as provided by the
Banco de Datos de la Naturaleza (Nature Data Bank), under the Ministry
of Environment (MITECO).

This dataset provides:

- `esp_get_grid_BDN()` extracts country-wide regular grids with
  resolutions of 5x5 or 10x10 kilometres (mainland Spain or Canary
  Islands).

- `esp_get_grid_BDN_ccaa()` extracts 1x1 kilometre resolution grids for
  individual Autonomous Communities.

These grids are useful for biodiversity analysis, environmental
monitoring, and spatial statistical applications.

`esp_get_grid_BDN_ccaa()` provides higher-resolution 1x1 kilometre grids
for specific Autonomous Communities, useful for regional analysis with
finer spatial detail.

## Usage

``` r
esp_get_grid_BDN(
  resolution = c(10, 5),
  type = c("main", "canary"),
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE
)

esp_get_grid_BDN_ccaa(
  ccaa,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE
)
```

## Source

Data sourced from the Banco de Datos de la Naturaleza (BDN) via a custom
CDN. See the repository structure:
<https://github.com/rOpenSpain/mapSpain/tree/sianedata/MTN>

For more information about BDN grids and other resources, visit:
<https://www.miteco.gob.es/es/biodiversidad/servicios/banco-datos-naturaleza/informacion-disponible/bdn-cart-aux-descargas-ccaa.html>.

## Arguments

- resolution:

  numeric. Resolution of the grid in kilometres. Must be one of:

  - `5`: 5x5 kilometre cells

  - `10`: 10x10 kilometre cells (default)

- type:

  character. The geographic scope of the grid:

  - `"main"`: Mainland Spain (default)

  - `"canary"`: Canary Islands

- update_cache:

  logical. Should the cached file be refreshed? Default is `FALSE`. When
  set to `TRUE` it would force a new download.

- cache_dir:

  character string. A path to a cache directory. See **Caching
  strategies** section in
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

- verbose:

  logical. If `TRUE` displays informational messages.

- ccaa:

  character string. A vector of names and/or codes for Autonomous
  Communities. See **Details** on
  [`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md)
  for accepted formats.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

## Details

The BDN provides standardized geographic grids for Spain that follow the
Nature Data Bank's specifications. The data is maintained via a custom
CDN and is regularly updated.

## See also

[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md)

Other geographical grids:
[`esp_get_grid_ESDAC()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_ESDAC.md),
[`esp_get_grid_MTN()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_MTN.md)

## Examples

``` r
# \donttest{
# Load a 10x10 km grid for mainland Spain
grid <- esp_get_grid_BDN(resolution = 10, type = "main")

# Visualize the grid
library(ggplot2)

ggplot(grid) +
  geom_sf(fill = NA, color = "steelblue") +
  theme_light() +
  labs(title = "BDN Geographic Grid: 10x10 km Spain")

# }
```
