#lang racket
(define x (list (list 1 2) (list 3 4) (list 5 6)))

(define (fringe ls)
    (if (null? ls)
        '()
        (cond ((not (pair? ls)) (list ls))
              (else  (append (fringe (car ls)) (fringe ( cdr ls)))))))
(fringe x)
(fringe (list x x))