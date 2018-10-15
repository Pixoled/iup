(defpackage #:iup-buttons
  (:use #:common-lisp
	#:alexandria)
  (:export #:buttons))

(defpackage #:iup-simple-notepad
  (:use #:common-lisp
	#:alexandria)
  (:export #:simple-notepad))

(defpackage #:iup-web-browser
  (:use #:common-lisp
	#:alexandria)
  (:export #:web-browser))

(defpackage #:iup-sample
  (:use #:common-lisp
	#:alexandria)
  (:export #:sample))

(defpackage #:iup-cube
  (:use #:common-lisp
	#:alexandria)
  (:export #:cube))

(defpackage #:iup-teapot
  (:use #:common-lisp
	#:alexandria)
  (:export #:teapot))

(defpackage #:iup-dialogs
  (:use #:common-lisp)
  (:export #:dialogs))

(defpackage #:iup-plottest
  (:use #:common-lisp)
  (:export #:plottest))

(defpackage #:iup-matrix
  (:use #:common-lisp)
  (:export #:matrix))

(defpackage #:iup-cells
  (:use #:common-lisp)
  (:export #:cells))

#+windows
(defpackage #:iup-flashbar
  (:use #:common-lisp)
  (:export #:flashbar))
