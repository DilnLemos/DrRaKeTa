#lang eopl

"Primero pasitos juju"
(define numeroA 10)
(define numeroB (* 2 numeroA))


"Operaciones Básicas"
(define (suma a b)(+ a b))
(define (multiplicar a b)(* a b))
(define (resta a b)(- a b))
(define (dividir a b)(/ a b))

"Ejercicio #1"
(define Ej1Try1 (+(expt(/ 1 4) 2)(* 3 5)(* 2 2)))

"Ejercicio #2"
(define Ej2Try1 (+ (* 4 (expt 5 3))(* 3 (- 5 3))(* 2 (+ (expt 3 2)(/ 4 4) 1)(-(/ 12 4) 3))))
(define Ej2Try2 (+(* 2 (+ 1 (expt 3 2)(/ 4 4)))(* 3 (- 5 3))(- (/ 12 4) 3)(* 4 (expt 5 3))))



"Funciones Anónimas + Condicionales"
(define comparar (lambda (x y)(if (> x y) x y)))

"Ejercicio #3"
(define Ej3Try1 (lambda (x y)(if (>= (and x y) 0)(* x y)(+ x y))))
(define Ej3Try2 (lambda (x y)(if (>= (* x y) 0)(* x y)(+ x y))))

"Ejemplo de Condicionales en Bloque"
(define ParImpar (lambda (n)(cond [(even? n) "par"][(< n 0) "Impar y menor a 0"][else "Impar y mayor o igual a 0"])))

"Ejercicio #4"
(define Ej4Try1 (lambda (n simb)(cond
                                  [(<= n 0) "Error"]
                                  [(and (> n 0) (string=? simb "m")) "hombre"]
                                  [(and (> n 0) (string=? simb "f")) "mujer"]
                                  [else "Error"])))

"Definiciones Locales"
"let"
(define funcion (lambda (n)(
                            let(
                                (p 2)
                                (f (lambda (a b)(* a b)))
                                )
                             (f n p)
                             )))

"letrec"
(define funcion2 (lambda (n)(
                             letrec(
                                    (p 2)
                                    (sume (lambda (a b)(if (= b 0) 0 (+ a (sume a (- b 1))))
                                            )
                                          )
                                    )
                              (sume n p)
                              )))


"let*"
(define funcion3 (lambda (n)(
                            let*(
                                 (p 2)
                                 (q 3)
                                 (r (+ p q n))
                                 )
                             r
                             )))

"listas"
(define lista (cons 1 (cons 2 (cons 3 empty))))

"Ejercicio #5"

(define factorial (lambda (n)(cond
                               [(= n 0) 1]
                               [else (* n (factorial(- n 1)))]
                               )))

(define lista_factorial (lambda (n)(letrec(
                                           (lista_factorial_aux (lambda (n acc)(if (= acc n)(factorial n)(
                                                                                                          cons(factorial acc)(lista_factorial_aux n (+ 1 acc)))
                                                                                   )
                                                                  )
                                                                )
                                           )
                                     (lista_factorial_aux n 0)
                                     )
                          )
  )

"Ejemplo diapositivas"
(define predicado (lambda (a b) (cond
                                  [(< a b)#T]
                                  [(even? a)#T]
                                  [else #F])))

(define filtro (lambda (lst num f) (cond
                                     [(eqv? lst '()) empty]
                                     [(f (car lst) num) (cons (car lst) (filtro (cdr lst) num f))]
                                     [else (filtro (cdr lst) num f)])))

"Set!"
(define valor 1)
(set! valor 2)

"Asignación y Secuenciación"

(define funcion4 (lambda (a b)
                   (begin (set! a (* a b))
                          (set! b (- a b))
                          (+ a b)
                          )
                         )
                   )
 
  
"fin"                   