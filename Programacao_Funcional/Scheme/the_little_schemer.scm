; Excersices from The Little Schemer 4th Edition (using Mit-Scheme)
; a is an atom, lat is a list of atoms

(define atom?
    (lambda (a)
        (and (not (pair? a)) (not (null? a))
)))

(define lat?
    (lambda (l)
        (cond
            ((null? l) #t)
            ((atom? (car l)) (lat? (cdr l)) )
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
                (member? a (cdr lat)) ))
)))

(define rember
    (lambda (a lat)
        (cond
            ((null? lat) lat)
            ((eq? (car lat) a) (cdr lat))
            (else 
                (cons (car lat) (rember a (cdr lat)) ))
)))

(define firsts
    (lambda (l)
        (if 
            (null? l) l
            (cons (car (car l)) (firsts (cdr l)) )
)))
