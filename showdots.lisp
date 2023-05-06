;;;; Functions for showing lists in dot notation. Exercise from ANSI Common LISP

(defun showdot (lst)
	   "Takes a list and formats it as a string in dot notation."
	   (format NIL "(~A . ~A)"
		   (if (or (null (car lst)) (atom (car lst)))
		       (car lst)
		       (showdot (car lst)))
		   (if (or (null (cdr lst)) (atom (cdr lst)))
		       (cdr lst)
		       (showdot (cdr lst)))))

(defun showdots (lst)
  "Takes a list and prints it in dot notation. Returns nil."
  (progn
    (princ (showdot lst))
    nil))
