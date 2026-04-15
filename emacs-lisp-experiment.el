;;; emacs-lisp-experiment.el --- Description -*- lexical-binding: t; -*-
;;
;; No-one:
;; Package-Prefix: nil
;;
;; Copyright (C) 2026 Keith Keydel
;;
;; Author: Keith Keydel <keydelk@tuta.com>
;; Maintainer: Keith Keydel <keydelk@tuta.com>
;; Created: April 10, 2026
;; Modified: April 10, 2026
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex text tools unix vc wp
;; Homepage: https://github.com/keydelk/emacs-lisp-experiment
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;    Just a scratchpad for experimenting with Emacs Lisp
;;
;;; Code:

(defun decimal-format (num)
  "Format NUM in decimal."
  (format "%d" num))

(defun hex-format (num)
  "Format NUM in hexadecimal."
  (format "%x" num))

(defun string-to-decimal(str)
  "Return a list  of the decimal codes for a string STR."
  (mapcar 'decimal-format str))

(defun insert-string-decimal(str)
  "Insert a space separated string of the decimal formatted character codes in STR."
  (insert (mapconcat 'decimal-format str " ")))

(defun decode-decimal-string (str)
  "Split STR into a list of decimals and return cooresponding characters."
  (mapconcat (lambda (x)(format "%c" x))  (mapcar 'cl-parse-integer (split-string str))))

(defun insert-string-bytes(str)
  "Insert bytes of a string STR."
  (insert (mapconcat 'hex-format str " ")))

(provide 'emacs-lisp-experiment)

;;; emacs-lisp-experiment.el ends here
