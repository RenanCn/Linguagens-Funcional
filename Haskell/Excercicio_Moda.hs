import Data.List

-- Agrupa elementos iguais da lista ordenada
agrupamento (a) = groupBy (==) (sort (a))

-- Calcula o tamanho da lista
tamanho [] = 0
tamanho (x:xs) = 1 + tamanho xs

-- Calcula o tamanho dos itens agrupados
maphead_count tamanho lista = [tamanho x|x <- agrupamento (lista)]

-- Ordena e faz união de elementos únicos da lista
unico (a) = nub(sort(a))

-- Zipa listas e ordena pelo primeiro elemento de cada tupla
zipar (a) = sort(zip(maphead_count tamanho (a)) (unico (a)))

-- Repetições da moda
repeticoes_moda (a) = fst(last(zipar (a)))

-- Filtra a(s) tupla(s) com valor(es) da moda
moda_tuplas (a) = filter (\(x,y) -> repeticoes_moda(a) == x) (zipar (a))

-- Letra a)
-- Pega a(s) tupla(s) com a(s) moda(s) e pegam seu segundo elemento, com o valor da moda propriamente dito, podendo ser mais de um quando as quantidades se repetem.
moda (a) = [snd x|x <- moda_tuplas (a)]

-- Letra b)
-- Quantidade de modas
count_moda(a) = length(moda (a))

