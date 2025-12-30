# SIANE bulk download

Download zipped data from SIANE to the
[`cache_dir`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md)
and extract the relevant ones.

## Usage

``` r
esp_siane_bulk_download(
  cache_dir = NULL,
  update_cache = FALSE,
  verbose = FALSE
)
```

## Source

CartoBase ANE provided by Instituto Geografico Nacional (IGN),
<http://www.ign.es/web/ign/portal>. Years available are 2005 up to
today.

Copyright:
<https://centrodedescargas.cnig.es/CentroDescargas/cartobase-ane>

It's necessary to always acknowledge authorship using the following
formulas:

1.  When the original digital product is not modified or altered, it can
    be expressed in one of the following ways:

    - CartoBase ANE 2006-2024 CC-BY 4.0 ign.es

    - CartoBase ANE 2006-2024 CC-BY 4.0 Instituto Geográfico Nacional

2.  When a new product is generated:

- Obra derivada de CartoBase ANE 2006-2024 CC-BY 4.0 ign.es

Data distributed via a custom CDN, see
<https://github.com/rOpenSpain/mapSpain/tree/sianedata>.

## Arguments

- cache_dir:

  character string. A path to a cache directory. See **Caching
  strategies** section in
  [`esp_set_cache_dir()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_set_cache_dir.md).

- update_cache:

  logical. Should the cached file be refreshed? Default is `FALSE`. When
  set to `TRUE` it would force a new download.

- verbose:

  logical. If `TRUE` displays informational messages.

## Value

A (invisible) character vector with the full path of the files
extracted. See **Examples**.

## See also

Other datasets representing political borders:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
[`esp_get_comarca()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_comarca.md),
[`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md),
[`esp_get_gridmap`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_gridmap.md),
[`esp_get_munic()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md),
[`esp_get_nuts()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_nuts.md),
[`esp_get_prov()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov.md),
[`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md),
[`esp_get_simpl`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_simpl.md),
[`esp_get_spain()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md)

Political borders from CartoBase ANE:
[`esp_get_capimun()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_capimun.md),
[`esp_get_ccaa_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_ccaa_siane.md),
[`esp_get_countries_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_countries_siane.md),
[`esp_get_munic_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_munic_siane.md),
[`esp_get_prov_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_prov_siane.md),
[`esp_get_spain_siane()`](https://ropenspain.github.io/mapSpain/dev/reference/esp_get_spain_siane.md)

## Examples

``` r
tmp <- file.path(tempdir(), "testexample")
dest_files <- esp_siane_bulk_download(cache_dir = tmp)

# Read one
library(sf)
read_sf(dest_files[1]) |> head()
#> Simple feature collection with 6 features and 16 fields
#> Geometry type: MULTIPOLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 1.438781 ymin: 39.67722 xmax: 28.58508 ymax: 51.56253
#> Geodetic CRS:  ETRS89
#> # A tibble: 6 × 17
#>   fecha_alta fecha_baja rotulo     id_iso2  t_ua x_cvi y_cvi x_cap y_cap id_iso3
#>   <date>     <date>     <chr>      <chr>   <int> <dbl> <dbl> <dbl> <dbl> <chr>  
#> 1 2005-12-31 2019-12-31 Albania    AL         97 20.1   41.1 19.8   41.3 ALB    
#> 2 2005-12-31 2019-12-31 Andorra    AD         97  1.58  42.5  1.52  42.5 AND    
#> 3 2005-12-31 2019-12-31 Bélgica    BE         97  4.68  50.6  4.37  50.8 BEL    
#> 4 2005-12-31 2019-12-31 Bosnia y … BA         97 17.8   44.2 18.4   43.9 BIH    
#> 5 2005-12-31 2019-12-31 Liechtens… LI         97  9.56  47.2  9.52  47.1 LIE    
#> 6 2005-12-31 2019-12-31 Bulgaria   BG         97 25.2   42.8 23.3   42.7 BGR    
#> # ℹ 7 more variables: id_pais <chr>, id_palt <chr>, id_leng <chr>,
#> #   rotulo2 <chr>, st_area_sh <dbl>, st_length_ <dbl>, geom <MULTIPOLYGON [°]>

# Now we can connect the function with the downloaded data like:

connect <- esp_get_munic_siane(cache_dir = tmp, verbose = TRUE)
#> ℹ Cache dir is C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/testexample/siane.
#> ✔ File already cached: C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/testexample/siane/se89_3_admin_muni_a_x.gpkg.
#> ℹ Cache dir is C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/testexample/siane.
#> ✔ File already cached: C:\Users\RUNNER~1\AppData\Local\Temp\RtmpKaXjaS/testexample/siane/se89_3_admin_muni_a_y.gpkg.

# Message shows that file is already cached ;)

# Clean
unlink(tmp, force = TRUE, recursive = TRUE)
```
