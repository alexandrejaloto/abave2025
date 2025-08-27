# carregar pacotes que serão usados na aula ----

library(mirt)

# análise de itens dicotômicos ----

# importar banco
data(banco.2pl, package = 'abave2025')

names(banco.2pl)

# confirmar que os itens são dicotômicos
table(banco.2pl$Item_1)

# função apply para toda a tabela (quando usa 2, a função percorre cada coluna)
# retirar a coluna 11 que se refere ao grupo
apply(banco.2pl[,-11], 2, table)

# confirmar os grupos
table(banco.2pl$grupo)

# calibrar os itens no modelo logístico de dois parâmetros
fit.2pl <- mirt(data = banco.2pl[,-11], model = 1, itemtype = '2PL')

# verificar os parâmetros dos itens
mirt::coef(fit.2pl)

# verificar os parâmetros dos itens de forma simplificada
coef(fit.2pl, simplify = TRUE)

# verificar os parâmetros dos itens (dificuldade em vez do intercepto) de forma simplificada
coef(fit.2pl, IRTpars = TRUE, simplify = TRUE)

# armazenar os parâmetros em um objeto
pars <- data.frame(coef(fit.2pl, IRTpars = TRUE, simplify = TRUE)$items)
pars

# curva de informação do teste
plot(fit.2pl, type = 'info')

# confiabilidade do teste em função do escore
plot(fit.2pl, type = 'rxx')

# erro padrão de medida em função do escore
plot(fit.2pl, type = 'SE')

# informação do teste e erro padrão
plot(fit.2pl, type = 'infoSE')

# curva de informação de cada item
plot(fit.2pl, type = 'infotrace')

# curva característica de cada item
plot(fit.2pl, type = 'trace')

# gráficos de cada item

itemplot(fit.2pl, 1, 'info')
itemplot(fit.2pl, 1, 'SE')
itemplot(fit.2pl, 1, 'trace')
itemplot(fit.2pl, 1, 'infoSE')
itemplot(fit.2pl, 1, 'infotrace')

# calcular o escore dos sujeitos e o erro de medida
escore.2pl <- fscores(object = fit.2pl, full.scores.SE = TRUE)
head(escore.2pl)

# análise de DIF ----

# calibrar usando a função para múltiplos grupos
fit.2pl.mg <- multipleGroup(data = banco.2pl[,-11],
                            model = 1,
                            group = banco.2pl$grupo,
                            itemtype = '2PL',
                            invariance = c('free_mean',
                                           'free_var',
                                           colnames(banco.2pl)))

pars.mg <- coef(fit.2pl.mg, IRTpars = TRUE, simplify = TRUE)
pars.mg

# funções para análise de DIF no mirt (após a aula, estude a ajuda das funções)
dif.mirt <- DIF(MGmodel = fit.2pl.mg, which.par = c('a1', 'd'), scheme = 'drop')

# Deixar o Item_2 e o Item_8 livres melhora o modelo de forma estatisticamente significativa
dif.mirt

dif.rmsd <- RMSD_DIF(pooled_mod = fit.2pl.mg)

# o valor do Item_2 é discrepante
dif.rmsd

# conclusão: o Item_2 e o Item_8 possuem DIF

# calibrar deixando o Item_2 e o Item_8 livres entre os grupos
fit.2pl.mg2 <- multipleGroup(data = banco.2pl[,-11],
                             model = 1,
                             group = banco.2pl$grupo,
                             itemtype = '2PL',
                             invariance = c('free_mean',
                                            'free_var',
                                            colnames(banco.2pl)[-c(2,8)]))

pars.mg2 <- coef(fit.2pl.mg2, IRTpars = TRUE, simplify = TRUE)

pars.mg2

# análise de DIF (lembrando que o Item_2 e o Item_8 estão livres)
dif.mirt <- DIF(MGmodel = fit.2pl.mg2, which.par = c('a1', 'd'), items2test = c(1, 3:7, 9, 10), scheme = 'drop')
dif.mirt

dif.rmsd <- RMSD_DIF(pooled_mod = fit.2pl.mg2)
dif.rmsd
