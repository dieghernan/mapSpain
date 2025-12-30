# Displace a [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object located in the Canary Islands

Helper function to displace an external
[`sf`](https://r-spatial.github.io/sf/reference/sf.html) object
(potentially representing a location in the Canary Islands) to align it
with the objects provided by
[`sf`](https://r-spatial.github.io/sf/reference/sf.html) with the option
`moveCAN = TRUE`.

## Usage

``` r
esp_move_can(x, moveCAN = TRUE)
```

## Arguments

- x:

  An [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object. It
  may be `sf` or `sfc` object.

- moveCAN:

  A logical `TRUE/FALSE` or a vector of coordinates `c(lat, lon)`. It
  places the Canary Islands close to Spain's mainland. Initial position
  can be adjusted using the vector of coordinates.

## Value

A [`sf`](https://r-spatial.github.io/sf/reference/sf.html) object of the
same class and same CRS than `x` but displaced accordingly.

## Details

This is a helper function that intends to ease the representation of
objects located in the Canary Islands that have been obtained from other
sources rather than the package
[mapSpain](https://CRAN.R-project.org/package=mapSpain).

## Displacing the Canary Islands

While `moveCAN` is useful for visualization, it would alter the actual
geographic position of the Canary Islands. When using the output for
spatial analysis or using tiles (e.g. with
[`esp_get_tiles()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_tiles.md)
or
[`addProviderEspTiles()`](https://ropenspain.github.io/mapSpain/dev/reference/addProviderEspTiles.md))
this option should be set to `FALSE` in order to get the actual
coordinates, instead of the modified ones.

## See also

Other helpers for the Canary Islands:
[`esp_get_can_box()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_can_box.md)

## Examples

``` r
library(sf)
teide <- data.frame(
  name = "Teide Peak",
  lon = -16.6437593,
  lat = 28.2722883
)

teide_sf <- st_as_sf(teide, coords = c("lon", "lat"), crs = 4326)

# If we use any mapSpain produced object with moveCAN = TRUE...

esp <- esp_get_spain(moveCAN = c(13, 0))

library(ggplot2)


ggplot(esp) +
  geom_sf() +
  geom_sf(data = teide_sf, color = "red") +
  labs(
    title = "Canary Islands displaced",
    subtitle = "But not the external Teide object"
  )



# But we can

teide_sf_disp <- esp_move_can(teide_sf, moveCAN = c(13, 0))

ggplot(esp) +
  geom_sf() +
  geom_sf(data = teide_sf_disp, color = "red") +
  labs(
    title = "Canary Islands displaced",
    subtitle = "And also the external Teide object"
  )

```
