#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))


(define (count-leaves t)
  (accumulate (lambda (x y)(+ 1 y)) 0 (map enumerate-tree t)))
; (count-leaves '(list 1 (list 2 (list 3 4)) 5))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))
; (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)) )