#lang racket
(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (make-branch length structure)
  (list length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (define (branch-weight branch)
    (let ((weight (branch-structure branch)))
    (if (pair? weight)
        (total-mobile weight)
        weight)))
  (define (total-mobile mobile)
    ( + (branch-weight (left-branch mobile)) (branch-weight  (right-branch mobile))))
  (total-mobile mobile))


(define branch3 (make-branch 2 8))
(define branch5 (make-branch 4 4))
(define mobile35 (make-mobile branch3 branch5))
(define branch3-mobile35 (make-branch 3 mobile35))
(define mobile-3-35-5 (make-mobile branch3-mobile35 branch5))
(total-weight mobile-3-35-5)

(define a (make-mobile (make-branch 2 3) (make-branch 2 3))) 
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(define c (make-mobile (make-branch 2 a) (make-branch 2 b))) 

;(define (is-balanced mobile)
;  (let ((left (left-branch mobile))
;        (right (right-branch mobile)))
;  (if (not (pair? (branch-structure left)))
;      (branch-weight left




(define (balanced? mobile)
  (let (( left-structure (branch-structure (left-branch mobile)))
        (right-structure (branch-structure (right-branch mobile))))
  (if (branch-balanced? mobile)
      (and #t
           (if (pair? left-structure)
               (and (balanced? left-structure) (balanced? right-structure))
               #t))
      #f)))
      

(define (branch-balanced? mobile)
    (let (( left (left-branch mobile))
        (right (right-branch mobile)))
      (= (branch-power? left) (branch-power? right))))
                  
(define (branch-power? branch)
  (let ((structure (branch-structure branch)))
    (if (not (pair? structure))
        (* (branch-length branch) structure)
        (* (branch-length branch) (total-weight structure)))))

(balanced? a)
(balanced? b)
(balanced? c)



(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
       tree))
(define tree (list 1 (list 2 (list 3 4) 5 ) (list 6 7 )))
(define (square-tree tree) (tree-map square tree))
(define square (lambda (x) (* x x)))
(square-tree tree)