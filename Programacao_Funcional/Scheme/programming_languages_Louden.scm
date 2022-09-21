; (append '(1 2) '(3 4 5)) -> (1 2 3 4 5)
; (cons 1 (cons 2 '(3 4 5)))

(define append
    (lambda (l m)
        (if (null? l) m
            (cons (car l) (append (cdr l) m) )
)))

; (reverse '(1 2 3)) -> (3 2 1)

(define reverse
    (lambda (l)
        (if (null? l) l
            (append (reverse (cdr l)) (list (car l)) )
)))