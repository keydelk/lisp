(defun shift-char (chr offset)
  "Shift CHR by offset."
  (let ((cap-a (char-code #\A))
        (sm-a (char-code #\a))
        (code (char-code chr))
        (num-letters 26))
    (cond ((and (char>= chr #\A)
                (char<= chr #\Z))
           (code-char (+ cap-a
                         (mod
                          (+ offset
                             (- code cap-a))
                          num-letters))))
          ((and (char>= chr #\a)
                (char<= chr #\z))
           (code-char (+ sm-a
                         (mod
                          (+ offset
                             (- code sm-a))
                          num-letters))))
          (t chr))))

(defun caesar (str offset)
  "Encode STR using a rotational caesar cipher shifting by OFFSET."
  (map 'string #'(lambda (x) (shift-char x offset)) str))
