#lang racket

;;; 逐次平方を使った再帰的べき乗プロセス
;どんどん分解していく
; (fast-expt 2 10)
; (square (fast-expt 2 5)
; (square (* 2 (fast-expt 2 4))
; (square (* 2 (square (fast-expt 2 2))
; (square (* 2 (square (square (fast-expt 2 1))
; (square (* 2 (square (square (* 2 (fast-expt 2 0))
; (square (* 2 (square (square (* 2 1)
; (square (* 2 (square (square 2)
; (square (* 2 (square 4)
; (square (* 2 16)
; (square 32)
; 1024
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

;;; 逐次平方を使った反復的べき乗プロセス
;どんどん分解していく
;(fast-iter 1 2 10)        = 1 * 2^10
;(fast-iter 1 4 5)         = 1 * 4^5
;(fast-iter 4 4 4)         = 4 * 4^4
;(fast-iter 4 16 2)        = 4 * 16^2
;(fast-iter 4 256 1)       = 4 * 256^1
;(fast-iter 1024 256 0)    = 1024 * 256^0
;1024
(define (fast-iter a b n)
    (cond ((= n 0) a)
        ((even? n) (fast-iter a (square b) (/ n 2)))
        (else (fast-iter (* a b) b (- n 1)))))