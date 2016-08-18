#lang racket
(define (reverse ls)
  (define (itr ls acc)
    (if (null? ls)
        acc
        (itr (cdr ls)
             (cons (car ls) acc))))
  (itr ls '()))

(define (deep-reverse ls)
  (cond (( null? ls) '())
        (( not (pair? (car ls))) (reverse ls))
        (else (append (deep-reverse (cdr ls)) (list (deep-reverse (car ls)))))))

 (deep-reverse (list (list 1 2) ( list 3 4) (list 5 6)))

;(define (deep-reverse items)
;  (cond ((null? items) null)
;        ((pair? (car items))
;         (append (deep-reverse (cdr items)) 
;                 (list (deep-reverse (car items)))))
;        (else
;         (append (deep-reverse (cdr items))
;                 (list (car items))))))

(define (fringe ls )
( cond (( null? ls) '())
           (( not ( pair? ls )) ls)
           ( else ( cons ( fringe ( car ls)) (fringe ( cdr ls))))))
(fringe (list (list 1 2) (list 3 4)))