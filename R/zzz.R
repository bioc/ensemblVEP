.onAttach <-
    function(libname, pkgname)
{
    msg <- paste0("vep script not found. ",
                  "Ensembl VEP is not installed in your path.")
    tryCatch(check <- system2(.getVepPath(),
        stdout=TRUE, stderr=TRUE),
        error=function(e) packageStartupMessage(msg))


    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname,
        "3.20; Functionality has been moved to VariantAnnotation")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))


}
