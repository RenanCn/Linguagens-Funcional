-- Haskell

-- Tamanho da lista
tamanho[] = 0
tamanho(x:xs) = 1 + tamanho xs

-- Soma números da lista
soma[] = 0
soma(x:xs) = x + soma xs

-- Subtrai números da lista
subtrai[] = 0
subtrai(x:xs) = x - subtrai xs

-- Multiplica números da lista
multiplica[] = 1
multiplica(x:xs) = x * multiplica xs

-- Divide números da lista
divide[] = 0
divide(x:xs) = x / multiplica xs

-- Elemento mínimo
minimo :: (Ord a) => [a] -> a 
minimo [] = error "Lista Vazia"
minimo [x] = x  
minimo (x:y:xs) = minimo ((if x < y then x else y):xs)

-- Elemento máximo
maximo :: (Ord a) => [a] -> a 
maximo [] = error "Lista Vazia"
maximo [x] = x  
maximo (x:y:xs) = maximo ((if x > y then x else y):xs)