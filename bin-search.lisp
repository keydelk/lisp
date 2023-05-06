;;;; Binary search on sorted vector from ANSI Common LISP by Graham

;;; helper function
(defun finder (obj vec start end key test)
  (let ((range (- end start)))
    (if (zerop range)
	(if (funcall test obj (funcall key (aref vec start)))
	    obj
	    nil)
	(let ((mid (+ start (round (/ range 2)))))
	  (let ((obj2 (funcall key (aref vec mid))))
	    (if (< obj obj2)
		(finder obj vec start (- mid 1) key test)
		(if (> obj obj2)
		    (finder obj vec (+ mid 1) end key test)
		    obj)))))))

;;; Main function

(defun bin-search (obj vec
		   &key (key #'identity) (test #'eql) (start 0) (end (- (length vec) 1)))
  "Finds an element in a sorted vector."
  (and (not (zerop (- end start)))
       (finder obj vec start end key test)))
