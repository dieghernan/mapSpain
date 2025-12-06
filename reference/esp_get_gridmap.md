# Get a [`sf`](https://r-spatial.github.io/sf/reference/sf.html) hexbin or squared `POLYGON` of Spain

Loads a hexbin map
([`sf`](https://r-spatial.github.io/sf/reference/sf.html) object) or a
map of squares with the boundaries of the provinces or autonomous
communities of Spain.

## Usage

``` r
esp_get_hex_prov(prov = NULL)

esp_get_hex_ccaa(ccaa = NULL)

esp_get_grid_prov(prov = NULL)

esp_get_grid_ccaa(ccaa = NULL)
```

## Arguments

- prov:

  A vector of names and/or codes for provinces or `NULL` to get all the
  provinces. See **Details**.

- ccaa:

  A vector of names and/or codes for autonomous communities or `NULL` to
  get all the autonomous communities. See **Details**.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) `POLYGON`
object.

## Details

Hexbin or grid map has an advantage over usual choropleth maps. In
choropleths, a large polygon data looks more emphasized just because of
its size, what introduces a bias. Here with hexbin, each region is
represented equally dismissing the bias.

You can use and mix names, ISO codes, `"codauto"/ "cpro"` codes (see
[esp_codelist](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md))
and NUTS codes of different levels.

When using a code corresponding of a higher level (e.g.
`esp_get_prov("Andalucia")`) all the corresponding units of that level
are provided (in this case , all the provinces of Andalusia).

Results are provided in **EPSG:4258**, use
[`sf::st_transform()`](https://r-spatial.github.io/sf/reference/st_transform.html)
to change the projection.

## See also

Other political:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md),
[`esp_get_can_box()`](https://ropenspain.github.io/mapSpain/reference/esp_get_can_box.md),
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/reference/esp_get_ccaa.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/reference/esp_get_comarca.md),
[`esp_get_country()`](https://ropenspain.github.io/mapSpain/reference/esp_get_country.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_prov.md),
[`esp_get_simpl_prov()`](https://ropenspain.github.io/mapSpain/reference/esp_get_simplified.md)

## Examples

``` r
esp <- esp_get_country()
hexccaa <- esp_get_hex_ccaa()

library(ggplot2)

ggplot(hexccaa) +
  geom_sf(data = esp) +
  geom_sf(aes(fill = codauto), alpha = 0.3, show.legend = FALSE) +
  geom_sf_text(aes(label = label), check_overlap = TRUE) +
  theme_void() +
  labs(title = "Hexbin: CCAA")
#> Warning: st_point_on_surface may not give correct results for longitude/latitude data



hexprov <- esp_get_hex_prov()

ggplot(hexprov) +
  geom_sf(data = esp) +
  geom_sf(aes(fill = codauto), alpha = 0.3, show.legend = FALSE) +
  geom_sf_text(aes(label = label), check_overlap = TRUE) +
  theme_void() +
  labs(title = "Hexbin: Provinces")
#> Warning: st_point_on_surface may not give correct results for longitude/latitude data



gridccaa <- esp_get_grid_ccaa()

ggplot(gridccaa) +
  geom_sf(data = esp) +
  geom_sf(aes(fill = codauto), alpha = 0.3, show.legend = FALSE) +
  geom_sf_text(aes(label = label), check_overlap = TRUE) +
  theme_void() +
  labs(title = "Grid: CCAA")
#> Warning: st_point_on_surface may not give correct results for longitude/latitude data



gridprov <- esp_get_grid_prov()

ggplot(gridprov) +
  geom_sf(data = esp) +
  geom_sf(aes(fill = codauto), alpha = 0.3, show.legend = FALSE) +
  geom_sf_text(aes(label = label), check_overlap = TRUE) +
  theme_void() +
  labs(title = "Grid: Provinces")
#> Warning: st_point_on_surface may not give correct results for longitude/latitude data
```
