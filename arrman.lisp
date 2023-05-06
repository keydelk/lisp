;;;; This file contains array manipulation functions

;;; Quarter-turn takes a square array (dimensions are (n n)) and rotates
;;; it 90 degress clockwise. For example:
;;; > (quarter-turn #2A((a b) (c d)))
;;; #2A((C A) (D B)
;;;
;;; A B  _\  C A
;;; C D  _/  D B

(defun quarter-turn (arr)
  "Turns the array 90 degrees clockwise"
  (let ((dims (array-dimensions arr)))
    (let ((out (make-array dims))
	  (rows (car dims))
	  (cols (cadr dims)))
      (do ((i 0 (+ i 1)))
	  ((>= i rows) out)
	(do ((j 0 (+ j 1)))
	    ((>= j cols) out)
	  (setf (aref out i j)
		(aref arr (- rows j 1) i)))))))
