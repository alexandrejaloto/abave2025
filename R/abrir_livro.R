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
  curso_path <- system.file("comandos/index.html", package = "abave2025")

  if (curso_path == "") {
    stop("Material do curso não encontrado. Instale o pacote corretamente.")
  }

  utils::browseURL(curso_path)
  message("Material do curso aberto no navegador!")
}
