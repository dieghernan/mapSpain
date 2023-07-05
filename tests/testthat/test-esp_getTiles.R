test_that("tiles error", {
  skip_if_not_installed("terra")


  df <- data.frame(a = 1, b = 2)

  expect_error(esp_getTiles(df), "Only sf and sfc objects allowed")

  ff <- esp_get_prov("La Rioja")

  expect_error(esp_getTiles(ff,
    type = "IGNBase",
    options = list(format = "image/aabbcc")
  ))
  expect_error(esp_getTiles(ff, type = list(format = "image/aabbcc")))
})


test_that("tiles online", {
  skip_if_not_installed("slippymath")
  skip_if_not_installed("terra")
  skip_if_not_installed("png")


  poly <- esp_get_ccaa("La Rioja")
  expect_error(esp_getTiles(poly, type = "FFF"))


  # Skip test as tiles sometimes are not available
  skip_on_cran()
  skip_if_offline()
  skip("Skip tile")

  save_png <- function(code, width = 200, height = 200) {
    path <- tempfile(fileext = ".png")
    png(path, width = width, height = height)
    on.exit(dev.off())
    terra::plotRGB(code)

    path
  }
  expect_s4_class(esp_getTiles(poly, "IGNBase.Todo"), "SpatRaster")

  expect_message(esp_getTiles(poly,
    "IGNBase.Todo",
    zoom = 7,
    verbose = TRUE,
    update_cache = TRUE
  ))


  s <- esp_getTiles(poly, "IGNBase.Todo", zoom = 7)


  # With sfc
  geom <- sf::st_geometry(poly)

  # Convert from bbox

  bbox <- sf::st_bbox(poly)
  expect_error(esp_getTiles(bbox, "IGNBase.Todo", zoom = 7))
  expect_silent(esp_getTiles(sf::st_as_sfc(bbox), "IGNBase.Todo",
    zoom = 7
  ))

  frombbox <- esp_getTiles(sf::st_as_sfc(bbox), "IGNBase.Todo",
    zoom = 7
  )

  expect_s3_class(geom, "sfc")

  expect_silent(esp_getTiles(geom, "IGNBase.Todo",
    zoom = 7
  ))

  sfc <- esp_getTiles(geom, "IGNBase.Todo", zoom = 7)

  # From cache
  expect_message(esp_getTiles(poly, "IGNBase.Todo",
    zoom = 7, verbose = TRUE
  ))
  expect_message(esp_getTiles(poly, "IGNBase.Todo",
    zoom = 7, verbose = TRUE
  ))
  expect_message(esp_getTiles(
    poly,
    zoom = 7,
    verbose = TRUE,
    type = "IGNBase.Orto"
  ))

  expect_message(esp_getTiles(poly,
    type = "RedTransporte.Carreteras",
    verbose = TRUE, mask = TRUE
  ))
  expect_message(esp_getTiles(poly,
    type = "RedTransporte.Carreteras",
    verbose = TRUE, mask = TRUE
  ))


  # Try with jpg
  provs <- leaflet.providersESP.df
  jpeg <- provs[provs$value == "jpeg", ]

  expect_message(esp_getTiles(poly,
    type = as.character(jpeg$provider[1]),
    verbose = TRUE
  ))

  s <- esp_getTiles(poly,
    type = jpeg$provider
  )

  expect_s4_class(s, "SpatRaster")

  # Check layers
  n <- expect_silent(esp_getTiles(poly,
    type = "RedTransporte.Carreteras"
  ))


  expect_equal(terra::nlyr(n), 4)

  opaque <- expect_silent(esp_getTiles(poly,
    type = "RedTransporte.Carreteras",
    transparent = FALSE
  ))

  expect_equal(terra::nlyr(opaque), 3)

  # Run only locally
  skip_on_ci()

  # Single point
  point <- esp_get_ccaa("Madrid")
  point <- sf::st_transform(point, 3857)

  point <- sf::st_centroid(
    sf::st_geometry(point),
    of_largest_polygon = TRUE
  )

  expect_length(point, 1)
  expect_s3_class(point, "sfc_POINT")

  expect_message(esp_getTiles(point,
    "IGNBase.Todo",
    verbose = TRUE
  ))

  p <- esp_getTiles(point, "IGNBase.Todo", verbose = TRUE)



  expect_snapshot_file(save_png(opaque), "opaque.png")
  expect_snapshot_file(save_png(n), "transp.png")
  expect_snapshot_file(save_png(s), "silent.png")
  expect_snapshot_file(save_png(p), "point.png")
  expect_snapshot_file(save_png(sfc), "sfc.png")
  expect_snapshot_file(save_png(frombbox), "frombbox.png")
})


test_that("tiles masks and crops", {
  skip_if_not_installed("slippymath")
  skip_if_not_installed("terra")
  skip_if_not_installed("png")


  # Skip test as tiles sometimes are not available
  skip_on_cran()
  skip_if_offline()

  poly <- esp_get_ccaa("La Rioja", epsg = 4326)
  tile <- esp_getTiles(poly, "IGNBase.Todo", crop = FALSE)
  expect_s4_class(tile, "SpatRaster")

  tilecrop <- esp_getTiles(poly, "IGNBase.Todo", crop = TRUE)
  expect_s4_class(tilecrop, "SpatRaster")

  tilemask <- esp_getTiles(poly, "IGNBase.Todo", mask = TRUE)
  expect_s4_class(tilemask, "SpatRaster")

  # Try with EPSG 3857

  poly <- esp_get_ccaa("La Rioja", epsg = 3857)
  tile <- esp_getTiles(poly, "IGNBase.Todo", crop = FALSE)
  expect_s4_class(tile, "SpatRaster")

  tilecrop <- esp_getTiles(poly, "IGNBase.Todo", crop = TRUE)
  expect_s4_class(tilecrop, "SpatRaster")

  tilemask <- esp_getTiles(poly, "IGNBase.Todo", mask = TRUE)
  expect_s4_class(tilemask, "SpatRaster")
})


test_that("tiles options", {
  skip_if_not_installed("slippymath")
  skip_if_not_installed("terra")
  skip_if_not_installed("png")


  # Skip test as tiles sometimes are not available
  skip_on_cran()
  skip_if_offline()

  poly <- esp_get_capimun(munic = "^Toledo", epsg = 3857)
  poly <- sf::st_buffer(poly, 20)

  tile2 <- esp_getTiles(poly,
    type = "RedTransporte.Carreteras",
    options = list(
      version = "1.3.0",
      crs = "EPSG:25830",
      format = "image/jpeg"
    )
  )

  expect_s4_class(tile2, "SpatRaster")

  # Known problem on SSH certificate of catastro on ci
  skip_on_ci()
  tile <- esp_getTiles(poly,
    type = "Catastro.Building",
    options = list(styles = "elfcadastre")
  )
  expect_s4_class(tile, "SpatRaster")
})

test_that("Custom WMS", {
  skip_if_not_installed("slippymath")
  skip_if_not_installed("terra")
  skip_if_not_installed("png")


  # Skip test as tiles sometimes are not available
  skip_on_cran()
  skip_if_offline()

  segovia <- esp_get_prov_siane("segovia", epsg = 3857)
  custom_wms <- list(
    id = "new_cached_test",
    q = paste0(
      "https://idecyl.jcyl.es/geoserver/ge/wms?request=GetMap",
      "&service=WMS&version=1.3.0",
      "&format=image/png",
      "&CRS=epsg:3857",
      "&layers=geolog_cyl_litologia",
      "&styles="
    )
  )

  tile <- esp_getTiles(segovia, type = custom_wms)
  expect_s4_class(tile, "SpatRaster")
})


test_that("Custom WMTS", {
  skip_if_not_installed("slippymath")
  skip_if_not_installed("terra")
  skip_if_not_installed("png")


  # Skip test as tiles sometimes are not available
  skip_on_cran()
  skip_if_offline()

  segovia <- esp_get_prov_siane("segovia", epsg = 3857)
  custom_wmts <- list(
    id = "cyl_wmts",
    q = paste0(
      "https://www.ign.es/wmts/ign-base?",
      "request=GetTile&service=WMTS&version=1.0.0",
      "&format=image/png",
      "&tilematrixset=GoogleMapsCompatible",
      "&layer=IGNBaseTodo-nofondo&style=default"
    )
  )


  tile <- esp_getTiles(segovia, type = custom_wmts)
  expect_s4_class(tile, "SpatRaster")

  # Non-INSPIRE e.g OSM
  another_wms <- list(
    id = "OSM2",
    q = "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
  )

  tile2 <- esp_getTiles(segovia, type = another_wms)
  expect_s4_class(tile2, "SpatRaster")

  # With another extension
  esri_wsm <- list(
    id = "ESRI_WorldStreetMap",
    q = paste0(
      "https://server.arcgisonline.com/ArcGIS/rest/services/",
      "World_Street_Map/MapServer/tile/{z}/{y}/{x}.jpg"
    )
  )

  tile3 <- esp_getTiles(segovia, type = esri_wsm)
  expect_s4_class(tile3, "SpatRaster")
})
