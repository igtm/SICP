#lang racket
(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq) (fold-right op init (cdr seq)))))

(define (fold-left op init seq)
  (if (null? seq)
      init
      (fold-left op (op init (car seq)) (cdr seq))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

; 2.39 写像の入れ子
; A
 (accumulate append
            '()
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 6)))
; i:1,j:0 -> '()  i:2,j:1 -> '((2 1))  i:3,j:2 -> '((3 1) (3 2)) 
; '(() ((2 1)) ((3 1) (3 2)) ((4 1) (4 2) (4 3)) ((5 1) (5 2) (5 3) (5 4)) ((6 1) (6 2) (6 3) (6 4) (6 5)))
; '((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5))

; A'
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))


(define (smallest-divisor n)
   (find-divisor n 2))

(define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
         ((divides? test-divisor n) test-divisor)
         (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
   (= (remainder b a) 0))

(define (square x)
   (* x x))

(define (prime? n)
   (= n (smallest-divisor n)))
; B
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
; C 
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; 完成形 A A' B C
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                       (map (lambda (j) (list i j))
                            (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))



; 順列 P
(define (permutations s)
  (if (null? s)                    ; 空集合?
      (list '())                   ; 空集合を含むリスト
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))
(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))
