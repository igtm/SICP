#lang racket
;1.17

; * が使えないと仮定して、multという乗算手続きを作成
(define (mult-iter x y)
  (define (mult x y)
    (+ x (mult x (- y 1))))
  (define (double x)
    (mult x 2))
  (define (halve x)
    (/ x 2))
  (cond ((= y 0) 1)
        ((even? y) (mult (mult-iter x (halve y)) 2))
        (else (mult
  