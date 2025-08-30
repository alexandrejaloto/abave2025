#' @title Testar pacote
#'
#' @name teste
#'
#' @description Testa se o pacote foi instalado corretamente,
#' bem como as dependências dos pacotes.
#'
#' @return Caso o teste não tenha identificado erro, uma
#' mensagem será emitida no console e o livro do curso será
#' aberto no navegador.
#'
#' @author Alexandre Jaloto
#'
#' @examples
#' teste()

teste <- function() {

  nzchar(find.package('mirt'))
  nzchar(find.package('latticeExtra'))
  nzchar(find.package('abave2025'))

  fit.2pl <- mirt::mirt(data = banco.2pl[,-11], model = 1, itemtype = '2PL')

  if(exists('fit.2pl'))
  {
    abrir_livro()
    print('Os pacotes foram instalados com sucesso')
  }
}
