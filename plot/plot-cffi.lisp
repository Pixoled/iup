(defpackage #:iup-plot-cffi
  (:use #:common-lisp))

(in-package #:iup-plot-cffi)

(cffi:define-foreign-library iup-plot
  (:unix "libiup_plot.so")
  (:windows "iup_plot.dll")
  (t (:default "iup_plot")))

(cffi:use-foreign-library iup-plot)

(cffi:defcfun (%iup-plot-open "IupPlotOpen") :void)

(cffi:defcfun (%iup-plot "IupPlot") iup-cffi::ihandle)

(cffi:defcfun (%iup-plot-begin "IupPlotBegin") :void
  (handle iup-cffi::ihandle)
  (str-x-data :boolean))

(cffi:defcfun (%iup-plot-add "IupPlotAdd") :void
  (handle iup-cffi::ihandle)
  (x :double)
  (y :double))

(cffi:defcfun (%iup-plot-add-segment "IupPlotAddSegment") :void
  (handle iup-cffi::ihandle)
  (x :double)
  (y :double))

(cffi:defcfun (%iup-plot-add-str "IupPlotAddStr") :void
  (handle iup-cffi::ihandle)
  (x :string)
  (y :double))

(cffi:defcfun (%iup-plot-end "IupPlotEnd") :int
  (handle iup-cffi::ihandle))

(cffi:defcfun (%iup-plot-load-data "IupPlotLoadData") :int
  (handle iup-cffi::ihandle)
  (filename :string)
  (str-x-data :boolean))

;; /* available only when linking with "iupluaplot" */
;; int IupPlotSetFormula(Ihandle* ih, int sample_count, const char* formula, const char* init);

(cffi:defcfun (%iup-plot-insert "IupPlotInsert") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x :double)
  (y :double))

(cffi:defcfun (%iup-plot-insert-str "IupPlotInsertStr") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x :double)
  (y :double))

(cffi:defcfun (%iup-plot-insert-segment "IupPlotInsertSegment") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x :double)
  (y :double))

(cffi:defcfun (%iup-plot-insert-str-samples "IupPlotInsertStrSamples") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x (:pointer :string))
  (y (:pointer :double))
  (count :int))

(cffi:defcfun (%iup-plot-insert-samples "IupPlotInsertSamples") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x (:pointer :double))
  (y (:pointer :double))
  (count :int))

(cffi:defcfun (%iup-plot-add-samples "IupPlotAddSamples") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x (:pointer :double))
  (y (:pointer :double))
  (count :int))

(cffi:defcfun (%iup-plot-add-str-samples "IupPlotAddStrSamples") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x (:pointer :string))
  (y (:pointer :double))
  (count :int))

(cffi:defcfun (%iup-plot-get-sample "IupPlotGetSample") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x (:pointer :string))
  (y (:pointer :double)))

(cffi:defcfun (%iup-plot-get-sample-str "IupPlotGetSampleStr") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x (:pointer :string))
  (y (:pointer :double)))

(cffi:defcfun (%iup-plot-get-sample-selection "IupPlotGetSampleSelection") :int
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int))

(cffi:defcfun (%iup-plot-get-sample-extra "IupPlotGetSampleExtra") :double
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int))

(cffi:defcfun (%iup-plot-set-sample "IupPlotSetSample") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x :double)
  (y :double))

(cffi:defcfun (%iup-plot-set-sample-str "IupPlotSetSampleStr") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (x :string)
  (y :double))

(cffi:defcfun (%iup-plot-set-sample-selection "IupPlotSetSampleSelection") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (selected :int))

(cffi:defcfun (%iup-plot-set-sample-extra "IupPlotSetSampleExtra") :void
  (handle iup-cffi::ihandle)
  (ds-index :int)
  (sample-index :int)
  (extra :double))

(cffi:defcfun (%iup-plot-transform "IupPlotTransform") :void
  (handle iup-cffi::ihandle)
  (x :double)
  (y :double)
  (cnv-x (:pointer :double))
  (cnv-y (:pointer :double)))

(cffi:defcfun (%iup-plot-transform-to "IupPlotTransformTo") :void
  (handle iup-cffi::ihandle)
  (cnv-x :double)
  (cnv-y :double)
  (x (:pointer :double))
  (y (:pointer :double)))

(cffi:defcfun (%iup-plot-find-sample "IupPlotFindSample") :int
  (handle iup-cffi::ihandle)
  (cnv-x :double)
  (cnv-y :double)
  (ds-index (:pointer :int))
  (sample-index (:pointer :int)))

(cffi:defcfun (%iup-plot-find-segment "IupPlotFindSegment") :int
  (handle iup-cffi::ihandle)
  (cnv-x :double)
  (cnv-y :double)
  (ds-index (:pointer :int))
  (sample-1-index (:pointer :int))
  (sample-2-index (:pointer :int)))

(cffi:defcfun (%iup-plot-paint-to "IupPlotPaintTo") :void
  (handle iup-cffi::ihandle)
  (cd-canvas cd-cffi::cd-canvas))
