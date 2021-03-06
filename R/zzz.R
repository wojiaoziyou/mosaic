
.mosaicEnv <- new.env()
assign("mosaic.theme",   list(), envir = .mosaicEnv)
assign("mosaic.options", list(), envir = .mosaicEnv)

.onLoad <- function(libname, pkgname) {
    ## library.dynam("mosaic", pkgname, libname )
    mosaic.par.set(.defaultMosaicOptions())
}

.onAttach <- function(libname, pkgname) {
  # have histogram use xhistogram stuff by default
  origLatticeOptions <- lattice::lattice.options(
    histogram.breaks = xhistogramBreaks,
    prepanel.default.histogram = prepanel.xhistogram,
    panel.histogram = panel.xhistogram)
  assign("original.lattice.options", origLatticeOptions, envir = .mosaicEnv)
  packageStartupMessage(
    paste0("\nThe 'mosaic' package masks several functions from core packages ",
           "in order to add \nadditional features.  ",
           "The original behavior of these functions should not be affected by this.",
           "\n\nNote: If you use the Matrix package, be sure to load it BEFORE loading mosaic."
           ),
    appendLF = TRUE)
}

.noGenerics <- FALSE

.onUnload <- function(libpath) {
    ## library.dynam.unload("mosaic", libpath)
}


