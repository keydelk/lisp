;; Working file for testing code snippets

(ql:quickload "iterate")
(use-package :iterate)

(ql:quickload "for")

(loop for i in '(1 2 3 4)
      collect (* 3 i))

(iter (for i from 1 to 10)
  (collect (* 3 i)))

(for:for ((c over "Hello World"))
  (format t "~2,'0x " (char-int c)))

(let ((amt 100)
      (rate 0.03)
      (days 365))
  (dotimes (n days amt)
    (setq amt (+ amt (* amt rate)))
    ))

(defun frange (start end &optional (step 1))
  "Returns a list of numbers from START to END, increasing by STEP (default 1)"
  (if (> start end)
      nil
      (cons start (frange (+ start step) end step))))

(frange 2 20 2)
