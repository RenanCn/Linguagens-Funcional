-- Haskell

-- Fun��es simples
-- Fibonacci
fib n 
  | n == 1 = 1
  | n == 2 = 1
  | otherwise = fib(n-1) + fib(n-2)

-- Fatorial
fat n 
  | n == 0 = 1
  | otherwise = n*fat(n-1)


-- Listas
-- Tamanho da lista
tamanho[] = 0
tamanho(x:xs) = 1 + tamanho xs

-- Soma n�meros da lista
soma[] = 0
soma(x:xs) = x + soma xs

-- Subtrai n�meros da lista
subtrai[] = 0
subtrai(x:xs) = x - subtrai xs

-- Multiplica n�meros da lista
multiplica[] = 1
multiplica(x:xs) = x * multiplica xs

-- Divide n�meros da lista
divide[] = 1
divide(x:xs) = x / divide xs

-- Elemento m�nimo
minimo :: (Ord a) => [a] -> a 
minimo [] = error "Lista Vazia"
minimo [x] = x  
minimo (x:y:xs) = minimo ((if x < y then x else y):xs)

-- Elemento m�ximo
maximo :: (Ord a) => [a] -> a 
maximo [] = error "Lista Vazia"
maximo [x] = x  
maximo (x:y:xs) = maximo ((if x > y then x else y):xs)

-- Verifica se um objeto pertence � lista
pertence p [] = False
pertence p (x:xs) | p==x = True
                  | otherwise = pertence p xs

-- Adiciona um objeto � lista
insere c [] = [c]
insere c (x:xs) | c == x = x:xs
                | otherwise = x : insere c xs

-- Concatena duas listas
concatena (x) (y) = x ++ y

-- Inverte lista
inverte (x) =  reverse x

-- Verifica se � um pal�ndromo
palindromo (x)
  | x == reverse (x) = True
  | otherwise = False


-- N�meros primos
-- Caso base
isCasoBase :: Int -> Bool
isCasoBase x
        | x == 2 = True
        | otherwise = isPrime x

-- Verifica se � primo
isPrime :: Int -> Bool
isPrime x
          | x >= 2 = ((x `mod` (x-1)) /= 0) && not (isPrime (x-1))
          | otherwise = False

-- Verifica se os n�meros da lista s�o primos
arePrimes :: [Int] -> Bool
arePrimes = all isCasoBase

-- List Comprehension
-- Pega os n�meros pares da lista
lista_pares a = [x | x <- a, par x]

par:: Int -> Bool
par x = mod x 2 == 0

-- Pega os n�meros �mpares da lista
lista_impares a = [x | x <-a, impar x]
impar:: Int-> Bool
impar x = mod x 2 == 1

-- Fibonacci com mapeamento
fib2 :: [Int] -> [Int]
fib2 [] = []
fib2 (x:xs) = fib x : fib2 xs