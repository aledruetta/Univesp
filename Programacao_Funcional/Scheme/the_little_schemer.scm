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
            ((null? lat) '())
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

; (insertR 3 2 '(1 2 4 5)) -> (1 2 3 4 5)

(define insertR
    (lambda (new old lat)
        (if (null? lat) '()
            (cond 
                ( (eq? old (car lat)) (cons old (cons new (cdr lat))) )
                ( else (cons (car lat) (insertR new old (cdr lat))   ))
))))

; (subst 3 2 '(1 2 4 2)) -> (1 3 4 2)

(define subst
    (lambda (new old lat) 
        (if (null? lat) '()
            (cond
                ((eq? old (car lat)) (cons new (cdr lat)))
                (else (cons (car lat) (subst new old (cdr lat))))
))))