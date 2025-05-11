## function called when the package is attached, that is
## interactively loaded with library(pkg)
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("This is the package of the IEO project template.\n",
                        "Type vignette(\"IEOprojectAnalysis\") to\n",
                        "read through the analysis of this RNA-seq dataset.\n")
}
