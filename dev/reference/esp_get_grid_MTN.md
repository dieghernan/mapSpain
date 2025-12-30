# National geographic grids from IGN MTN ((Mapa Topografico Nacional)

Loads a [`sf`](https://r-spatial.github.io/sf/reference/sf.html)
`POLYGON` with the geographic grids of Spain.

## Usage

``` r
esp_get_grid_MTN(
  grid = "MTN25_ETRS89_Peninsula_Baleares_Canarias",
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE
)
```

## Source

IGN data via a custom CDN (see
<https://github.com/rOpenSpain/mapSpain/tree/sianedata/MTN>).

## Arguments

- grid:

  Name of the grid to be loaded. See **Details**.

- update_cache:

  logical. Should the cached file be refreshed? Default is `FALSE`. When
  set to `TRUE` it would force a new download.

- cache_dir:

  character string. A path to a cache directory. See **Caching
  strategies** section in
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

- verbose:

  logical. If `TRUE` displays informational messages.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`.

## Details

Metadata available on
<https://github.com/rOpenSpain/mapSpain/tree/sianedata/MTN>.

Possible values of `grid` are:

|                                          |
|------------------------------------------|
| **grid_name**                            |
| MTN25_ED50_Peninsula_Baleares            |
| MTN25_ETRS89_ceuta_melilla_alboran       |
| MTN25_ETRS89_Peninsula_Baleares_Canarias |
| MTN25_RegCan95_Canarias                  |
| MTN50_ED50_Peninsula_Baleares            |
| MTN50_ETRS89_Peninsula_Baleares_Canarias |
| MTN50_RegCan95_Canarias                  |
|                                          |

### MTN Grids

A description of the MTN (Mapa Topografico Nacional) grids available:

**MTN25_ED50_Peninsula_Baleares**

MTN25 grid corresponding to the Peninsula and Balearic Islands, in ED50
and geographical coordinates (longitude, latitude) This is the real
MTN25 grid, that is, the one that divides the current printed series of
the map, taking into account special sheets and irregularities.

**MTN50_ED50_Peninsula_Baleares**

MTN50 grid corresponding to the Peninsula and Balearic Islands, in ED50
and geographical coordinates (longitude, latitude) This is the real
MTN50 grid, that is, the one that divides the current printed series of
the map, taking into account special sheets and irregularities.

**MTN25_ETRS89_ceuta_melilla_alboran**

MTN25 grid corresponding to Ceuta, Melilla, Alboran and Spanish
territories in North Africa, adjusted to the new official geodetic
reference system ETRS89, in geographical coordinates (longitude,
latitude).

**MTN25_ETRS89_Peninsula_Baleares_Canarias**

MTN25 real grid corresponding to the Peninsula, the Balearic Islands and
the Canary Islands, adjusted to the new ETRS89 official reference
geodetic system, in geographical coordinates (longitude, latitude).

**MTN50_ETRS89_Peninsula_Baleares_Canarias**

MTN50 real grid corresponding to the Peninsula, the Balearic Islands and
the Canary Islands, adjusted to the new ETRS89 official reference
geodetic system, in geographical coordinates (longitude, latitude).

**MTN25_RegCan95_Canarias**

MTN25 grid corresponding to the Canary Islands, in REGCAN95 (WGS84
compatible) and geographic coordinates (longitude, latitude). It is the
real MTN25 grid, that is, the one that divides the current printed
series of the map, taking into account the special distribution of the
Canary Islands sheets.

**MTN50_RegCan95_Canarias**

MTN50 grid corresponding to the Canary Islands, in REGCAN95 (WGS84
compatible) and geographic coordinates (longitude, latitude). This is
the real grid of the MTN50, that is, the one that divides the current
printed series of the map, taking into account the special distribution
of the Canary Islands sheets.

## See also

Other geographical grids:
[`esp_get_grid_BDN()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_BDN.md),
[`esp_get_grid_ESDAC()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_grid_ESDAC.md)

## Examples

``` r
# \donttest{
grid <- esp_get_grid_MTN(grid = "MTN50_ETRS89_Peninsula_Baleares_Canarias")

library(ggplot2)

ggplot(grid) +
  geom_sf() +
  theme_light() +
  labs(title = "MTN50 Grid for Spain")

# }
```
