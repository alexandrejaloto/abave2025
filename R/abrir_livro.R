#' @title Abrir livro do curso
#'
#' @name abrir_livro
#'
#' @description Abre livro com os comandos do curso
#'
#' @return O livro é aberto no navegador
#'
#' @author Alexandre Jaloto
#'
#' @examples
#' abrir_livro()
#' @export

abrir_livro <- function() {

  url <- "https://alexandrejaloto.github.io/abave2025/"

  utils::browseURL(url)

  message("Material do curso aberto no navegador!")
}
