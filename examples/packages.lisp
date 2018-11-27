(defpackage #:iup-examples.simple-notepad
  (:use #:common-lisp
	#:alexandria)
  (:export #:simple-notepad))

(defpackage #:iup-examples.web-browser
  (:use #:common-lisp
	#:alexandria)
  (:export #:web-browser))

(defpackage #:iup-examples.sample
  (:use #:common-lisp
	#:alexandria)
  (:export #:sample))

(defpackage #:iup-examples.cube
  (:use #:common-lisp
	#:alexandria)
  (:export #:cube))

(defpackage #:iup-examples.teapot
  (:use #:common-lisp
	#:alexandria)
  (:export #:teapot))

(defpackage #:iup-examples.plottest
  (:use #:common-lisp)
  (:export #:plottest))

(defpackage #:iup-examples.matrix
  (:use #:common-lisp)
  (:export #:matrix))

#+windows
(defpackage #:iup-examples.flashbar
  (:use #:common-lisp)
  (:export #:flashbar))

(defpackage #:iup-examples.glcontrols
  (:use #:common-lisp
	#:alexandria)
  (:export #:glcontrols))
