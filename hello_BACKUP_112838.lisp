(defun string-to-bytes (str)
  "Returns a list of integer codes for each character in a string"
  (map 'list #'char-code str))

(defun bytes-to-string (bytes)
  "Returns a string from list of byte codes"
  (map 'string #'code-char bytes))

(princ "Hello World")

<<<<<<< HEAD
(format t "Hello World")

(defun str-to-bytes (str)
  "Returns a list of bytes for a string"
  (map 'list #'char-int str))

(remove-if-not #'evenp '(1 2 3 4 5 6 7 8))
=======
(defun hello-world ()
  "Print Hello World to the console."
  (princ "Hello World!"))
>>>>>>> refs/remotes/origin/master
