.open_environment <- function(
    from,
    to = parent.env(environment())
) {
    list2env(as.list(from), to)
}

.source_directory <- function(
    path,
    ...,
    source_environment
) {
    path %>%
        fs::dir_ls(recurse = TRUE, type = "file", glob = "*.R", ...) %>%
        walk(source, local = source_environment)
}

source_directory <- function(
    path,
    ...,
    environment. = parent.env(environment())
) {
    source_environment <- new.env()
    .source_directory(path, ..., source_environment = source_environment)

    if (!is.null(environment.))
        .open_environment(source_environment, to = environment.)

    return(invisible(source_environment))
}
