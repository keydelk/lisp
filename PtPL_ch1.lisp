;;;; Exercises from Portal to Practical Lisp, Small Projects from Another Dimension
;;;; By Mohammed Ismail Ansari
;;;; Chaper 1 exercises and practice

;; Data types

(equalp (cons 'Shepard (cons 'Joker nil)) (list 'Shepard 'Joker))

(equalp (list '+ 1 2) '(+ 1 2))

(describe 'equalp)

(princ (concatenate 'string
                    "The entered name is "
                    (read-line)))
