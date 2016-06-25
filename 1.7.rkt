#lang racket

(define (sqrt-iter guess pre-guess x)
  (if (good-enough? guess pre-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define good-enough-range 0.001)

(define (good-enough? guess pre-guess)
  (< (abs (- guess pre-guess)) good-enough-range))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 100.0 x))