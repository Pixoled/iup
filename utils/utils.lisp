(defpackage #:iup-utils
  (:use #:common-lisp)
  (:export #:alias
	   #:platform))

(in-package #:iup-utils)

;;; FIXME just use defalias from serapeum
(defmacro alias (target source) `(setf (fdefinition ,target) ,source))

(defun platform ()
  "Mapping from trivial-features -provided features to classesdb platform keywords."
  #+windows :windows
  #+linux :linux
  #+(and unix (not linux)) :unix)
