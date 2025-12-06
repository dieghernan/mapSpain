# [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object with all the municipalities of Spain (2019)

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object
including all municipalities of Spain as provided by GISCO (2019
version).

## Format

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object
(resolution: 1:1 million, EPSG:4258) object with 8,131 rows and columns:

- codauto:

  INE code of the autonomous community.

- ine.ccaa.name:

  INE name of the autonomous community.

- cpro:

  INE code of the province.

- ine.prov.name:

  INE name of the province.

- cmun:

  INE code of the municipality.

- name:

  Name of the municipality.

- LAU_CODE:

  LAU Code (GISCO) of the municipality. This is a combination of
  **cpro** and **cmun** fields, aligned with INE coding scheme.

- geometry:

  geometry field.

## Source

<https://ec.europa.eu/eurostat/web/gisco/geodata/statistical-units/local-administrative-units>,
LAU 2019 data.

## See also

[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md).

Other datasets:
[`esp_codelist`](https://ropenspain.github.io/mapSpain/reference/esp_codelist.md),
[`esp_nuts.sf`](https://ropenspain.github.io/mapSpain/reference/esp_nuts.sf.md),
[`esp_tiles_providers`](https://ropenspain.github.io/mapSpain/reference/esp_tiles_providers.md),
[`pobmun19`](https://ropenspain.github.io/mapSpain/reference/pobmun19.md)

Other municipalities:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/reference/esp_get_capimun.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/reference/esp_get_munic.md)

## Examples

``` r
data("esp_munic.sf")

teruel_cpro <- esp_dict_region_code("Teruel", destination = "cpro")

teruel_sf <- esp_munic.sf[esp_munic.sf$cpro == teruel_cpro, ]
teruel_city <- teruel_sf[teruel_sf$name == "Teruel", ]

# Plot

library(ggplot2)

ggplot(teruel_sf) +
  geom_sf(fill = "#FDFBEA") +
  geom_sf(data = teruel_city, aes(fill = name)) +
  scale_fill_manual(
    values = "#C12838",
    labels = "City of Teruel"
  ) +
  guides(fill = guide_legend(position = "inside")) +
  labs(
    fill = "",
    title = "Municipalities of Teruel"
  ) +
  theme_minimal() +
  theme(
    text = element_text(face = "bold"),
    panel.background = element_rect(colour = "black"),
    panel.grid = element_blank(),
    legend.position.inside = c(.2, .95)
  )
```
