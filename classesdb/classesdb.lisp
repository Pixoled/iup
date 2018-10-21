(in-package #:iup-classesdb)

(defparameter *static-metadata*
  (list (list :initializer 'iup:open
	      :child-p '("spinbox" "radio" "backgroundbox" "scrollbox" "flatscrollbox" "detachbox" "expander" "sbox")
	      :children-p '("cbox" "gridbox" "hbox" "vbox" "zbox" "normalizer" "frame" "flatframe" "tabs" "flattabs" "split")
	      :override-p '("image" "imagergb" "imagergba"))
	(list :initializer 'iup-controls:open)
	(list :initializer 'iup-gl:open
	      :child-p'("backgroundbox"))
	(list :initializer 'iup-glcontrols:open
	      :child-p '("glexpander" "glframe" "glscrollbox" "glsizebox")
	      :children-p '("glcanvasbox"))
	(list :initializer 'iup-scintilla:open)
	(list :initializer 'iup-plot:open)
	(list :initializer 'iup-mglplot:open)
	#+windows (list :initializer 'iup-olecontrol:open)
	(list :initializer 'iup-web:open
	      :classname-excludes '("olecontrol")))
  "Not everything about the IUP APIs can be extracted by
introspection. This describes the static metadata that is augmented
with IUP metadata upon introspection.")

(defun platform ()
  "Mapping from trivial-features -provided features to classesdb platform keywords."
  #+windows :windows
  #+linux :linux
  #+(and unix (not linux)) :unix)

(defun create-classesdb ()
  "Create a printable representaion of IUP metadata containing enough
information to create the Lisp API at compilation time."
  (flet ((sort-keywords (keywords)
	   (sort keywords #'string< :key #'symbol-name)))
    (loop with base-classnames = (iup:with-iup () (iup:all-classes))
	  for metadata in *static-metadata*
	  for initializer = (getf metadata :initializer)
	  for classes = (iup:with-iup () (funcall initializer) (iup:all-classes))
	  for classname-excludes = (getf metadata :classname-excludes)
	  for difference = (remove-if #'(lambda (classname)
					  (find classname classname-excludes :test #'string=))
				      (if (eq initializer 'iup:open)
					  base-classnames
					  (set-difference classes base-classnames :test #'string=)))
	  for children-p = (getf metadata :children-p)
	  for child-p = (getf metadata :child-p)
	  for override-p = (getf metadata :override-p)
	  collect (iup:with-iup ()
		    (funcall initializer)
		    (list :package (package-name (symbol-package initializer))
			  :classnames (loop for classname in difference
					    collect (list :classname classname
							  :child-p (and (find classname child-p :test #'string=) t)
							  :children-p (and (find classname children-p :test #'string=) t)
							  :override-p (and (find classname override-p :test #'string=) t)
							  :attributes (sort-keywords (iup:class-attributes classname))
							  :callbacks (sort-keywords (iup:class-callbacks classname))))))
	    into result
	  finally (return (list* :platform (platform) :metadata result)))))

(defun classesdb-pathname ()
  (asdf:system-relative-pathname "iup" "classesdb" :type "lisp-sexp"))

(defun read-classesdbs ()
  (let ((classesdb-pathname (classesdb-pathname)))
    (if (probe-file classesdb-pathname)
	(with-open-file (stream classesdb-pathname :direction :input)
	  (let ((*read-eval* nil))
	    (read stream stream)))
	'((:platform :linux)
	  (:platform :windows)
	  (:platform :unix)))))

(defun update-classesdbs (current-classesdbs classesdb)
  (let ((our-platform (platform)))
    (mapcar #'(lambda (existing-classesdb)
		(if (eq (getf existing-classesdb :platform) our-platform)
		    classesdb
		    existing-classesdb))
	    current-classesdbs)))

(defun write-classesdbs (classesdbs)
  (with-open-file (stream (classesdb-pathname) :direction :output :if-exists :supersede)
    (write classesdbs :stream stream :pretty t :right-margin 100)))

(defun regenerate ()
  (let* ((current-classesdbs (read-classesdbs))
	 (new-classesdb (create-classesdb))
	 (updated-classesdbs (update-classesdb current-classesdbs new-classesdb)))
    (write-classesdbs updated-classesdbs)))
