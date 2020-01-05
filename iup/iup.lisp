(in-package #:iup)

(defiupclasses "IUP")

(defun open ()
  (let ((ret (iup-cffi::%iup-open (cffi:null-pointer) (cffi:null-pointer))))
    (when (= ret +error+)
      (error "Can't initialize IUP"))))

(defalias close #'iup-cffi::%iup-close)

(defun call-with-iup (func)
  #+windows (iup-cffi::%set-process-dpi-aware)
  (iup:open)
  (unwind-protect
       (progn
	 (funcall func))
    (iup:close)
    (iup::unregister-all-callbacks)))

(defmacro with-iup (() &body body)
  `(call-with-iup #'(lambda () ,@body)))

(defalias main-loop               #'iup-cffi::%iup-main-loop)
(defalias loop-step               #'iup-cffi::%iup-loop-step)
(defalias loop-step-wait          #'iup-cffi::%iup-loop-step-wait)
(defalias main-loop-level         #'iup-cffi::%iup-main-loop-level)
(defalias flush                   #'iup-cffi::%iup-flush)
(defalias exit-loop               #'iup-cffi::%iup-exit-loop)
(defalias version-show            #'iup-cffi::%iup-version-show)
(defalias record-input            #'iup-cffi::%iup-record-input)
(defalias play-input              #'iup-cffi::%iup-play-input)
(defalias update                  #'iup-cffi::%iup-update)
(defalias update-children         #'iup-cffi::%iup-update-children)
(defalias redraw                  #'iup-cffi::%iup-redraw)
(defalias refresh                 #'iup-cffi::%iup-refresh)
(defalias refresh-children        #'iup-cffi::%iup-refresh-children)
(defalias version                 #'iup-cffi::%iup-version)
(defalias version-date            #'iup-cffi::%iup-version-date)
(defalias version-number          #'iup-cffi::%iup-version-number)
(defalias destroy                 #'iup-cffi::%iup-destroy)
(defalias detach                  #'iup-cffi::%iup-detach)
(defalias append                  #'iup-cffi::%iup-append)
(defalias insert                  #'iup-cffi::%iup-insert)
(defalias get-child               #'iup-cffi::%iup-get-child)
(defalias get-child-pos           #'iup-cffi::%iup-get-child-pos)
(defalias get-child-count         #'iup-cffi::%iup-get-child-count)
(defalias get-next-child          #'iup-cffi::%iup-get-next-child)
(defalias get-brother             #'iup-cffi::%iup-get-brother)
(defalias get-parent              #'iup-cffi::%iup-get-parent)
(defalias get-dialog              #'iup-cffi::%iup-get-dialog)
(defalias get-dialog-child        #'iup-cffi::%iup-get-dialog-child)
(defalias reparent                #'iup-cffi::%iup-reparent)
(defalias popup                   #'iup-cffi::%iup-popup)
(defalias show                    #'iup-cffi::%iup-show)
(defalias show-xy                 #'iup-cffi::%iup-show-xy)
(defalias hide                    #'iup-cffi::%iup-hide)
(defalias map                     #'iup-cffi::%iup-map)
(defalias unmap                   #'iup-cffi::%iup-unmap)
(defalias reset-attribute         #'iup-cffi::%iup-reset-attribute)
(defalias set-focus               #'iup-cffi::%iup-set-focus)
(defalias get-focus               #'iup-cffi::%iup-get-focus)
(defalias previous-field          #'iup-cffi::%iup-previous-field)
(defalias next-field              #'iup-cffi::%iup-next-field)

(defalias message       #'iup-cffi::%iup-message)
(defalias message-error #'iup-cffi::%iup-message-error)
(defalias message-alarm #'iup-cffi::%iup-message-alarm)
(defalias alarm         #'iup-cffi::%iup-alarm)

(defalias layout-dialog #'iup-cffi::%iup-layout-dialog)

(defalias image-get-handle #'iup-cffi::%iup-image-get-handle)
