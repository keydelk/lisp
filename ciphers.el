;;; Ciphers.el
;; A small set of functions for old-school ciphers for practice.

(defun shift-char (chr offset)
  "Shift the character CHR by OFFSET."
  (cond ((and (>= chr ?A)
	      (<= chr ?Z))
	 (+ ?A
	    (mod (+ offset
		    (- chr ?A))
		 26)))
	((and (>= chr ?a)
	      (<= chr ?z))
	 (+ ?a
	    (mod (+ offset
		    (- chr ?a))
		 26)))
	(t chr)))

(defun caesar (str offset)
  "Caesar cipher, shift each char in STR by OFFSET."
  (mapcar #'(lambda (x) (shift-char x offset)) str))

(defun insert-caesar (str key)
  "Insert the caesar cipher for STR with a key of KEY."
  (interactive "sString to encode: \nnNumeric key: ")
  (insert (mapconcat #'char-to-string (caesar str key))))






