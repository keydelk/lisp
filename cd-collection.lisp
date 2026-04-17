(defun make-cd (title artist rating ripped)
  "Make a cd entry (plist) with the TITLE, ARIST, RATING, and RIPPED flag."
  (list :title title :artist artist :rating rating :ripped ripped))

(defvar *db* nil)

(defun add-record (cd)
  "Add CD as a record to *db*."
  (push cd *db*))

(defun dump-db ()
  "Print *db* with nicely formatted output."
  (dolist (cd *db*)
    (format t "~{~a: ~10t~a~%~}~%" cd)))

(defun prompt-read (prompt)
  "Prompt the user for information and return it."
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  "Prompt the user for all information for a CD and return it as a cd plist."
  (make-cd
   (prompt-read "Title")
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
   (y-or-n-p "Ripped [y/n]")))

(defun add-cds ()
  "Prompt user for cds in loop and add to *db*."
  (loop (add-record (prompt-for-cd))
        (if (not (y-or-n-p "Another? [y/n]:")) (return))))

(defun save-db (filename)
  "Save *db* to disk, in current directory as FILENAME."
  (with-open-file (out filename
                       :direction :output
                       :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(defun load-db (filename)
  "Load a previously saved database from FILENAME"
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun select (selector-fn)
  "Select albums from *db* by a selector function SELECTOR-FN."
  (remove-if-not selector-fn  *db*))

(defun where (&key title artist rating (ripped nil ripped-p))
  #'(lambda (cd)
      (and
       (if title    (equal (getf cd :title)  title)  t)
       (if artist   (equal (getf cd :artist) artist) t)
       (if rating   (equal (getf cd :rating) rating) t)
       (if ripped-p (equal (getf cd :ripped) ripped) t))))

(defun update (selector-fn &key title artist rating (ripped nil ripped-p))
  "Update *db* SELECTOR-FN should be a where function, can update TITLE,
   ARTIST, RATING and RIPPED properties."
  (setf *db*
        (mapcar
         #'(lambda (row)
             (when (funcall selector-fn row)
               (if title    (setf (getf row :title)  title))
               (if artist   (setf (getf row :artist) artist))
               (if rating   (setf (getf row :rating) rating))
               (if ripped-p (setf (getf row :ripped) ripped)))
             row)
         *db*)))

(defun delete-rows (selector-fn)
  "Remove rows that match SELECTOR-FN (where function) from *db*."
  (setf *db* (remove-if selector-fn *db*)))

(load-db "cds.txt")
