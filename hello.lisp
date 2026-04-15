(defun string-to-bytes (str)
  "Returns a list of integer codes for each character in a string"
  (map 'list #'char-code str))

(defun bytes-to-string (bytes)
  "Returns a string from list of byte codes"
  (map 'string #'code-char bytes))

(princ "Hello World")

(defun hello-world ()
  "Print Hello World to the console."
  (princ "Hello World!"))
