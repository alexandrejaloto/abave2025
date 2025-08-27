#' @title Abrir apresentação do curso
#'
#' @name abrir_apresentacao
#'
#' @description Abre arquivo PPTX com a apresentação do curso
#'
#' @return O arquivo é aberto no programa adequado.
#'
#' @author Alexandre Jaloto
#'
#' @examples
#' abrir_apresentacao()
#' @export

abrir_apresentacao <- function() {

  caminho_ppt <- system.file("tomando_medidas.pptx", package = "abave2025")


  if (curso_path == "") {
    stop("Material do curso não encontrado. Instale o pacote corretamente.")
  }

  file.show(caminho_ppt)
}
