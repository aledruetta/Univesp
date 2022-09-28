; (append '(1 2) '(3 4 5)) -> (1 2 3 4 5)

(define append
    (lambda (l m)
        (if (null? l) m
            (cons (car l) (append (cdr l) m) )
)))

; (reverse '(1 2 3)) -> (3 2 1)

(define reverse
    (lambda (l)
        (if (null? l) l
            (append (reverse (cdr l)) (cons (car l) '()) )
)))

; Binary Search
; (tree '(1 (2 () (3 (4 () ()) (5 () ()))) ())) -> 2 4 3 5 1

(define (left B) (car (cdr B)))
(define (right B) (car (cdr (cdr B))))
(define (data B) (car B))

(define tree
    (lambda (B)
        (cond 
            ((null? B) '())
        (else 
            (tree (left B))
            (display (data B))
            (newline)
            (tree (right B))
))))

(define doblar
    (lambda (lat)
        (if (null? lat) '()
            (cons (* 2 (car lat)) (doblar (cdr lat)))
)))

(define print-squares
    (lambda (low high)
        (cond ((> low high) (newline))
        (else
            (display (* low low))
            (newline)
            (print-squares (+ 1 low) high)
))))

(define f (lambda (x) (* x x)))

(define ff (lambda (f) (lambda (x) (f x x))))

(let ((a 2) (b 3))
    (let ((a (+ a b)))
        (+ a b)))