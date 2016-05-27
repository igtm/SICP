#lang racket


(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))


(define ok-range 0.001)

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) ok-range))


(define (sqrt-iter guess x)
  (if good-enough? guess x)
  guess
  (sqrt-iter (improve guess x)
             x))

(define (sqrt x)
  (sqrt-iter 1.0 x))