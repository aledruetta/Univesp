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
                ((eq? old (car lat)) (cons new (cdr lat)) )
                (else (cons (car lat) (subst new old (cdr lat)) ))
))))

; (subst2 3 1 2 '(1 2 3 4)) -> (3 2 3 4)

(define subst2
    (lambda (new o1 o2 lat)
        (if (null? lat) '()
            (cond
                ((or (eq? o1 (car lat)) (eq? o2 (car lat)) ) (cons new (cdr lat)) )
                (else (cons (car lat) (subst2 new o1 o2 (cdr lat)) ))
))))

; (multirember 1 '(1 2 3 1 5 1)) -> (2 3 5)

(define multirember
    (lambda (a lat)
        (if (null? lat) '()
            (cond
                ((eq? (car lat) a) (multirember a (cdr lat)))
                (else (cons (car lat) (multirember a (cdr lat))))
))))

; (multiinsertR 3 1 '(1 2 3 1 5 1)) -> (1 3 2 3 1 3 5 1 3)

(define multiinsertR 
    (lambda (new old lat)
        (if (null? lat) '()
        (cond
            ((eq? (car lat) old) (cons old (cons new (multiinsertR new old (cdr lat)))))
            (else (cons (car lat) (multiinsertR new old (cdr lat))))
))))

; (multiinsertL 3 1 '(1 2 3 1 5 1)) -> (0 1 2 3 0 1 5 0 1)

(define multiinsertL
    (lambda (new old lat)
        (if (null? lat) '()
        (cond
            ((eq? (car lat) old) (cons new (cons old (multiinsertL new old (cdr lat)))))
            (else (cons (car lat) (multiinsertL new old (cdr lat))))
))))

; (multisubst 0 1 '(1 2 3 1 5 1)) -> (0 2 3 0 5 0)

(define multisubst
    (lambda (new old lat)
        (if (null? lat) '()
        (cond
            ((eq? (car lat) old) (cons new (multisubst new old (cdr lat))))
            (else (cons (car lat) (multisubst new old (cdr lat))))
))))

; Numbers

(define add1 (lambda (n) (+ n 1)))
(define sub1 (lambda (n) (- n 1)))

; (addtup '(1 2 3)) -> 6

(define addtup
    (lambda (tup)
        (if (null? tup) 0
            (+ (car tup) (addtup (cdr tup)))
)))

(define mult
    (lambda (n m)
        (if (zero? m) 0
            (+ n (mult n (- m 1)))
)))

(define tup+
    (lambda (tup1 tup2)
        (cond 
            ((null? tup1) tup2)
            ((null? tup2) tup1)
            (else 
                (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2))
)))))

(define <
    (lambda (n m)
        (cond
            ((zero? m) #f)
            ((zero? n) #t)
            (else (< (- n 1) (- m 1)))
)))

(define =
    (lambda (n m)
        (cond 
            ((zero? n) (zero? m))
            ((zero? m) #f)
            (else (= (- n 1) (- m 1)))
)))

(define =
    (lambda (n m)
        (cond
            ((< n m) #f)
            ((> n m) #f)
            (else #t)
)))

(define ^
    (lambda (n m)
        (if (zero? m) 1
            (* n (^ n (- m 1)))
)))

(define (^ n m)
    (if (zero? m) 1
        (* n (^ n (- m 1)))
))

(define //
    (lambda (n m)
        (if (< n m) 0
            (+ 1 (// (- n m) m))
)))

(define (length lat)
    (if (null? lat) 0
        (+ 1 (length (cdr lat)))
))

; (pick 2 '(a b c)) -> b

(define (pick n lat)
    (if (= n 1) (car lat)
        (pick (- n 1) (cdr lat))
))

; (rempick 2 '(a b c)) -> (a c)

(define (rempick n lat)
    (if (= n 1) (cdr lat)
        (cons (car lat) (rempick (- n 1) (cdr lat)))
))

; (no-nums '(a 1 b 2 c d 3)) -> (a b c d)

(define (no-nums lat)
    (cond 
        ((null? lat) '())
        ((number? (car lat)) (no-nums (cdr lat)))
        (else (cons (car lat) (no-nums (cdr lat))))
))

; (all-nums '(a 1 b 2 c d 3)) -> (1 2 3)

(define (all-nums lat)
    (cond
        ((null? lat) '())
        ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
        (else (all-nums (cdr lat)))
))

; (eqan? 'a 'a) -> #t
; (eqan? 'a 3) -> #f
; (eqan? 2 2) -> #t

(define (eqan? a1 a2)
    (cond
        ((and (number? a1) (number? a2)) (= a1 a2))
        ((or (number? a1) (number? a2)) #f)
        (else (eq? a1 a2))
))

; (occur 'a '(a b c a d a)) -> 3

(define (occur a lat)
    (cond
        ((null? lat) 0)
        ((eq? a (car lat)) (+ 1 (occur a (cdr lat))))
        (else (occur a (cdr lat)))
))

; (one 1) -> #t
; (one 2) -> #f

(define (one n) (and (number? n) (= n 1)))

; (rember* 'a '(a (b (c a) d a) e f (a g))) -> ((b (c) d) e f (g))

(define (rember* a lat)
    (cond
        ((null? lat) '())
        ((pair? (car lat)) (cons (rember* a (car lat)) (rember* a (cdr lat))))
        ((eq? a (car lat)) (rember* a (cdr lat)))
        (else (cons (car lat) (rember* a (cdr lat))))
))

(define (insertR* new old l)
    (cond
        ((null? l) '())
        ((pair? (car l)) (cons (insertR* new old (car l)) (insertR* new old (cdr l))))
        ((eq? (car l) old) (cons old (cons new (insertR* new old (cdr l)))))
        (else (cons (car l) (insertR* new old (cdr l))))
))

(define (occur* a l)
    (cond
        ((null? l) 0)
        ((pair? (car l)) (+ (occur* a (car l)) (occur* a (cdr l))))
        ((eq? (car l) a) (+ 1 (occur* a (cdr l))))
        (else (occur* a (cdr l)))
))

(define (sum lnum)
    (if (null? lnum) 0
        (+ (car lnum) (sum (cdr lnum)))
))
