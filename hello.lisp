(defun super ()
  (catch 'abort
    (sub)
    (format t "This won't print")))

(defun sub ()
  (throw 'abort 99))

(super)

(format t "Hello World")
