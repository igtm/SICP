#lang racket
(define tolerance 0.00001)

;1.35
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1)

; 1.36
(define (fixed-point-debug f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (begin
        (println next)
         (if (close-enough? guess next)
          next
          (try next)))))
  (try first-guess))

(define (println a)
  (begin
    (display a)
    (newline)))
(define (avarage a b)
  (/ (+ a b) 2))
;  (fixed-point-debug (lambda (x) (/ (log 1000) (log x))) 10)             ; 早い
;  (fixed-point-debug (lambda (x) (avarage x (/ (log 1000) (log x)))) 10)