#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


; 2.33 1
(define (map p sequence)
  (accumulate (lambda (x y) (p x)) nil sequence))
; 2.33 2
(define (append seq1 seq2)
  (accumulate cons nil ))
; 2.33 3
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))