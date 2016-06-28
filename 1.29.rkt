#lang racket
(define (simpson f a b n)
  (define (h)
    (/ (- b a) n))
  (define (y k)
    (f (+ a (* k (h)))))
  (define (coefficient k)
    (cond
      ((= k 0) 1)
      ((= k n) 1)
      ((even? k) 4)
      (else 2)))
  (define (proc k)
    (* (coefficient k) (y k)))
  (* (/ (h) 3) (sum proc 0 inc n)))


(define (inc a)
  (+ a 1))

(define (sum term a next b)
      (if (> a b)
       0
       (+ (term a)
          (sum term (next a) next b))))
(define (cube a)
  (* a a a))