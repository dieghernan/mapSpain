# NUTS 2024 for Spain [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object

This dataset represents Spanish regions at NUTS levels 0, 1, 2, and 3
according to the Nomenclature of Territorial Units for Statistics (NUTS)
classification for 2024.

## Format

An [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object with
`MULTIPOLYGON` geometries at 1:1 million resolution in
[EPSG:4258](https://epsg.io/4258) projection, containing 86 rows and 10
variables:

- `NUTS_ID`:

  NUTS identifier.

- `LEVL_CODE`:

  NUTS level code `(0,1,2,3)`.

- `CNTR_CODE`:

  Eurostat Country code.

- `NAME_LATN`:

  NUTS name on Latin characters.

- `NUTS_NAME`:

  NUTS name on local alphabet.

- `MOUNT_TYPE`:

  Mount Type, see **Details**.

- `URBN_TYPE`:

  Urban Type, see **Details**.

- `COAST_TYPE`:

  Coast Type, see **Details**.

- `geo`:

  Same as `NUTS_ID`, provided for compatibility with
  [eurostat](https://CRAN.R-project.org/package=eurostat).

- `geometry`:

  geometry field.

## Source

[NUTS_RG_01M_2024_4326.gpkg](https://gisco-services.ec.europa.eu/distribution/v2/nuts/gpkg/)
file.

## Details

`MOUNT_TYPE`: Mountain typology:

- `1`: More than 50% of the surface is covered by topographic mountain
  areas.

- `2`: More than 50% of the regional population lives in topographic
  mountain areas.

- `3`: More than 50% of the surface is covered by topographic mountain
  areas and more than 50% of the regional population lives in these
  mountain areas.

- `4`: Non-mountain region or other regions.

- `0`: No classification provided.

`URBN_TYPE`: Urban-rural typology:

- `1`: Predominantly urban region.

- `2`: Intermediate region.

- `3`: Predominantly rural region.

- `0`: No classification provided.

`COAST_TYPE`: Coastal typology:

- `1`: Coastal region (on the coast).

- `2`: Coastal region (less than 50% of the population living within 50
  km of the coastline).

- `3`: Non-coastal region.

- `0`: No classification provided.

## See also

[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md)

Other datasets:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/dev/reference/esp_codelist.md),
[`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/dev/reference/esp_tiles_providers.md),
[`pobmun25`](https://ropenspain.github.io/mapSpain/dev/reference/pobmun25.md)

## Examples

``` r
data("esp_nuts_2024")
head(esp_nuts_2024)
#> Simple feature collection with 6 features and 9 fields
#> Geometry type: MULTIPOLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -18.15996 ymin: 27.63846 xmax: 4.320228 ymax: 43.78924
#> Geodetic CRS:  ETRS89
#> # A tibble: 6 × 10
#>   NUTS_ID LEVL_CODE CNTR_CODE NAME_LATN           NUTS_NAME MOUNT_TYPE URBN_TYPE
#>   <chr>       <int> <chr>     <chr>               <chr>          <int>     <int>
#> 1 ES              0 ES        España              España            NA        NA
#> 2 ES1             1 ES        Noroeste            Noroeste          NA        NA
#> 3 ES2             1 ES        Noreste             Noreste           NA        NA
#> 4 ES3             1 ES        Comunidad de Madrid Comunida…         NA        NA
#> 5 ES4             1 ES        Centro (ES)         Centro (…         NA        NA
#> 6 ES5             1 ES        Este                Este              NA        NA
#> # ℹ 3 more variables: COAST_TYPE <int>, geo <chr>, geometry <MULTIPOLYGON [°]>
```
