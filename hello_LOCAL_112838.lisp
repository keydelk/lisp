(defun super ()
  (catch 'abort
    (sub)
    (format t "This won't print")))

(defun sub ()
  (throw 'abort 99))

(super)

(format t "Hello World")

(defun str-to-bytes (str)
  "Returns a list of bytes for a string"
  (map 'list #'char-int str))

(remove-if-not #'evenp '(1 2 3 4 5 6 7 8))
