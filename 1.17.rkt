#lang racket
;1.17

;偶数: 2 * 5 =>  (1 * 10)      => (* (/ x 2) (* y 2))
;奇数: 3 * 5 =>  ((2 * 5) + 5  => (+ 5 (* 2 5))
; * が使えないと仮定して、multという乗算手続きを作成
; 掛け算を対数的ステップ数で計算
;(mult-iter 2 5)
;(mult-iter 1 10)
;(+ 10 (mult-iter 0 10))
;
(define (mult-iter x y)

  (define (double d)
    (* d 2))
  
  (define (halve h)
    (/ h 2))
  
  (cond ((= x 1) y)
        ((even? x) (mult-iter (halve x) (double y)))
        (else (+ y (mult-iter (- x 1) y )))))

; 1.18
; 1.16と1.17を用いた、反復的プロセス
(define (mult x y)
  (define (double d)
    (* d 2))
  
  (define (halve h)
    (/ h 2))
  
  (define (iter x y n)
    (cond ((= x 0) n)
          ((even? x) (iter (halve x) (double y) n))
          (else (iter (- x 1) y (+ n y)))))
  (iter x y 0))