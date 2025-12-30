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

- prov, ccaa:

  character. A vector of names and/or codes for provinces and autonomous
  communities or` `NULL to get all the data. See **Details**.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object.

## Details

Hexbin (or grid) maps have an advantage over traditional choropleth
maps. In choropleths, regions with larger polygons tend to appear more
prominent simply because of their size, which introduces visual bias.
With hexbin maps, each region is represented equally, reducing this
bias.

You can use and mix names, ISO codes, `"codauto"/ "cpro"` codes (see
[esp_codelist](https://ropenspain.github.io/mapSpain/dev/reference/esp_codelist.md))
and NUTS codes of different levels.

When using a code corresponding of a higher level (e.g.
`esp_get_prov("Andalucia")`) all the corresponding units of that level
are provided (in this case , all the provinces of Andalusia).

Results are provided in **EPSG:4258**, use
[`sf::st_transform()`](https://r-spatial.github.io/sf/reference/st_transform.html)
to change the projection.

## See also

[`esp_get_simpl`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md).

Other datasets representing political borders:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_comarca.md),
[`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md),
[`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md),
[`esp_get_simpl`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md),
[`esp_siane_bulk_download()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_siane_bulk_download.md)

## Examples

``` r
# \donttest{
esp <- esp_get_spain()
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

# }
```
