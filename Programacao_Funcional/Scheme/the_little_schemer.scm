; Excersices from The Little Schemer 4th Edition (using Mit-Scheme)
; a is an atom, lat is a list of atoms

(define atom?
    (lambda (a)
        (and (not (pair? a)) (not (null? a))
)))

(define lat?
    (lambda (lat)
        (cond
            ((null? lat) #t)
            ((atom? (car lat)) (lat? (cdr lat)))
            (else #f)
)))

(define append
    (lambda (lat m)
        (if 
            (null? lat) m
            (cons (car lat) (append (cdr lat) m))
)))

(define member?
    (lambda (a lat)
        (cond
            ((null? lat) #f)
            (else (or 
                (eq? (car lat) a)
                (member? a (cdr lat))))
)))

(define rember
    (lambda (a lat)
        (cond
            ((null? lat) '())
            ((eq? (car lat) a) (cdr lat))
            (else (cons (car lat) (rember a (cdr lat))))
)))

; (rember 3 (1 2 3 4))
; (1 2 4)
