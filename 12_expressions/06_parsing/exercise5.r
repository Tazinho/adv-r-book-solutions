### The code generated by simple_source() lacks source references. Read the
### source code for sys.source() and the help for srcfilecopy(), then modify
### simple_source() to preserve source references. You can test your code by
### sourcing a function that contains a comment. If successful, when you look
### at the function, you’ll see the comment and not just the source code.

simple_source <- function(file, envir = new.env()) {
  stopifnot(file.exists(file))
  stopifnot(is.environment(envir))

  lines <- readLines(file, warn = FALSE)
  srcfile <- srcfilecopy(file, lines, file.mtime(file), isFile = TRUE)
  exprs <- parse(text = lines, srcfile = srcfile, keep.source = TRUE)

  if (length(exprs) == 0L) return(invisible())

  invisible(lapply(exprs, function(expr) { eval(expr, envir) }))
}

simple_source("../05_pairlists/exercise3.r", .GlobalEnv) -> o
curve2
# function(expr, xlim = c(0, 1), n = 100,
#                    env = parent.frame()) {
#   f <- pryr::make_function(alist(x = ), substitute(expr), env)

#   # Define axes!
#   x <- seq(xlim[1], xlim[2], length = n)
#   y <- f(x)

#   # Plot!
#   plot(x, y, type = "l", ylab = deparse(substitute(expr)))
# }

# It captures the comments!
