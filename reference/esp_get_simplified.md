# Get a simplified map of provinces and autonomous communities of Spain

Loads a simplified map
([`sf`](https://r-spatial.github.io/sf/reference/sf.html) object) with
the boundaries of the provinces or autonomous communities of Spain, as
provided by the **INE** (Instituto Nacional de Estadistica).

## Usage

``` r
esp_get_simpl_prov(
  prov = NULL,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE
)

esp_get_simpl_ccaa(
  ccaa = NULL,
  update_cache = FALSE,
  cache_dir = NULL,
  verbose = FALSE
)
```

## Source

INE: PC_Axis files

## Arguments

- prov:

  A vector of names and/or codes for provinces or `NULL` to get all the
  provinces. See **Details**.

- update_cache:

  A logical whether to update cache. Default is `FALSE`. When set to
  `TRUE` it would force a fresh download of the source file.

- cache_dir:

  A path to a cache directory. See **About caching**.

- verbose:

  Logical, displays information. Useful for debugging, default is
  `FALSE`.

- ccaa:

  A vector of names and/or codes for autonomous communities or `NULL` to
  get all the autonomous communities. See **Details**.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
object.

## Details

Results are provided **without CRS**, as provided on source.

You can use and mix names, ISO codes, `"codauto"/"cpro"` codes (see
[esp_codelist](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md))
and NUTS codes of different levels.

When using a code corresponding of a higher level (e.g.
`esp_get_simpl_prov("Andalucia")`) all the corresponding units of that
level are provided (in this case , all the provinces of Andalusia).

## About caching

You can set your `cache_dir` with
[`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/reference/esp_set_cache_dir.md).

Sometimes cached files may be corrupt. On that case, try re-downloading
the data setting `update_cache = TRUE`.

If you experience any problem on download, try to download the
corresponding .geojson file by any other method and save it on your
`cache_dir`. Use the option `verbose = TRUE` for debugging the API
query.

## See also

[`esp_get_hex_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md),
[`esp_get_hex_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md)

Other political:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md),
[`esp_get_can_box()`](https://ropenspain.github.io/mapSpain/reference/esp_get_can_box.md),
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_ccaa.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/reference/esp_get_comarca.md),
[`esp_get_country()`](https://ropenspain.github.io/mapSpain/reference/esp_get_country.md),
[`esp_get_gridmap`](https://ropenspain.github.io/mapSpain/reference/esp_get_gridmap.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_prov.md)

## Examples

``` r
# \donttest{
prov_simp <- esp_get_simpl_prov()

library(ggplot2)

ggplot(prov_simp) +
  geom_sf(aes(fill = ine.ccaa.name)) +
  labs(fill = "CCAA")


# Provs of Single CCAA

and_simple <- esp_get_simpl_prov("Andalucia")

ggplot(and_simple) +
  geom_sf()


# CCAAs

ccaa_simp <- esp_get_simpl_ccaa()

ggplot(ccaa_simp) +
  geom_sf() +
  geom_sf_text(aes(label = ine.ccaa.name), check_overlap = TRUE)

# }
```
