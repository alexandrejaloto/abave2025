#' @title Abrir apresentação do curso
#'
#' @name abrir_apresentacao
#'
#' @description Abre a apresentação do curso
#'
#' @return A apresentação é aberta em formato PDF no navegador
#'
#' @author Alexandre Jaloto
#'
#' @examples
#' abrir_apresentacao()
#' @export

abrir_apresentacao <- function() {

  url <- "https://alexandrejaloto.github.io/abave2025/tomando_medidas.pdf"

  utils::browseURL(url)

  message("Material do curso aberto no navegador!")
}
