;gnu clisp 2.49

(print "Hello, world!")

;Operações matemáticas

;2+2
(print (+ 2 2))

;((2+3)*(7-1)*2)
(print (*(+ 2 3) (- 7 1) 2))

;(2+7-6)/4*2
(print (*(/ (+ 2 7 -6) 4) 2))


;Listas

;cabeça
(print (car '(A (A B) E)))
;cauda
(print (cdr '(A (A B) E)))
;concatena
(print (cons '1 '(a b)))

;(A.NIL); = (A)
;(print (cons ('(A.1).("ca".(X.10))))) ; o ponto (.) separa os elementos da lista


;Funções

;quadrado de um número
(defun quadrado(x)
    (* x x)
)
(print (quadrado 5))

;maior número entre três
(defun maior(x y z)
    (if (> x y)
        (if (> x z) x z)
        (if (> y z) y z)
    )    
)

(print(maior 5 7 6))