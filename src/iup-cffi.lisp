(defpackage #:iup-cffi
  (:use #:common-lisp
	#:cffi
	#:alexandria))

(in-package #:iup-cffi)

(define-foreign-library iup
  (:unix "libiup.so")
  (t (:default "iup")))

(use-foreign-library iup)

(defconstant %iup-error 1)
(defconstant %iup-noerror 0)
(defconstant %iup-opened -1)
(defconstant %iup-invalid -1)
(defconstant %iup-invalid-id -10)

(defctype ihandle :pointer)

(defcfun (%iup-open "IupOpen") :int
  (argv :pointer)
  (argc :pointer))

(defcfun (%iup-close "IupClose") :void)
(defcfun (%iup-image-lib-open "IupImageLibOpen") :void)

(defcfun (%iup-main-loop "IupMainLoop") :int)
(defcfun (%iup-loop-step "IupLoopStep") :int)
(defcfun (%iup-loop-step-wait "IupLoopStepWait") :int)
(defcfun (%iup-main-loop-level "IupMainLoopLevel") :int)
(defcfun (%iup-fush "IupFlush") :void)
(defcfun (%iup-exit-loop "IupExitLoop") :void)

(defcfun (%iup-record-input "IupRecordInput") :int
  (filename :string)
  (mode :int))

(defcfun (%iup-record-input "IupPlayInput") :int
  (filename :string))

(defcfun (%iup-update "IupUpdate") :void
  (handle ihandle))

(defcfun (%iup-update-children "IupUpdateChildren") :void
  (handle ihandle))

(defcfun (%iup-redraw "IupRedraw") :void
  (handle ihandle)
  (children :int))

(defcfun (%iup-refresh "IupRefresh") :void
  (handle ihandle))

(defcfun (%iup-refresh-children "IupRefreshChildren") :void
  (handle ihandle))

(defcfun (%iup-load "IupLoad") :string
  (filename :string))

(defcfun (%iup-load "IupLoadBuffer") :string
  (filename :string))

(defcfun (%iup-version "IupVersion") :string)
(defcfun (%iup-date "IupVersionDate") :string)
(defcfun (%iup-version-number "IupVersionNumber") :int)

;; void      IupSetLanguage   (const char *lng);
;; char*     IupGetLanguage   (void);
;; void      IupSetLanguageString(const char* name, const char* str);
;; void      IupStoreLanguageString(const char* name, const char* str);
;; char*     IupGetLanguageString(const char* name);
;; void      IupSetLanguagePack(Ihandle* ih);

;; void      IupDestroy      (Ihandle* ih);
;; void      IupDetach       (Ihandle* child);
;; Ihandle*  IupAppend       (Ihandle* ih, Ihandle* child);
;; Ihandle*  IupInsert       (Ihandle* ih, Ihandle* ref_child, Ihandle* child);
;; Ihandle*  IupGetChild     (Ihandle* ih, int pos);
;; int       IupGetChildPos  (Ihandle* ih, Ihandle* child);
;; int       IupGetChildCount(Ihandle* ih);
;; Ihandle*  IupGetNextChild (Ihandle* ih, Ihandle* child);
;; Ihandle*  IupGetBrother   (Ihandle* ih);
;; Ihandle*  IupGetParent    (Ihandle* ih);
;; Ihandle*  IupGetDialog    (Ihandle* ih);
;; Ihandle*  IupGetDialogChild(Ihandle* ih, const char* name);
;; int       IupReparent     (Ihandle* ih, Ihandle* new_parent, Ihandle* ref_child);

;; int       IupPopup         (Ihandle* ih, int x, int y);
;; int       IupShow          (Ihandle* ih);
;; int       IupShowXY        (Ihandle* ih, int x, int y);
;; int       IupHide          (Ihandle* ih);
;; int       IupMap           (Ihandle* ih);
;; void      IupUnmap         (Ihandle* ih);

;; void      IupResetAttribute(Ihandle* ih, const char* name);
;; int       IupGetAllAttributes(Ihandle* ih, char** names, int n);
;; Ihandle*  IupSetAtt(const char* handle_name, Ihandle* ih, const char* name, ...);
;; Ihandle*  IupSetAttributes (Ihandle* ih, const char *str);
;; char*     IupGetAttributes (Ihandle* ih);

;; void      IupSetAttribute   (Ihandle* ih, const char* name, const char* value);

(defcfun (%iup-set-str-attribute "IupSetStrAttribute") :void
  (handle ihandle)
  (name :string)
  (value :string))

;; void      IupSetStrf        (Ihandle* ih, const char* name, const char* format, ...);
;; void      IupSetInt         (Ihandle* ih, const char* name, int value);
;; void      IupSetFloat       (Ihandle* ih, const char* name, float value);
;; void      IupSetDouble      (Ihandle* ih, const char* name, double value);
;; void      IupSetRGB         (Ihandle* ih, const char* name, unsigned char r, unsigned char g, unsigned char b);

;; char*     IupGetAttribute(Ihandle* ih, const char* name);
;; int       IupGetInt      (Ihandle* ih, const char* name);
;; int       IupGetInt2     (Ihandle* ih, const char* name);
;; int       IupGetIntInt   (Ihandle* ih, const char* name, int *i1, int *i2);
;; float     IupGetFloat    (Ihandle* ih, const char* name);
;; double    IupGetDouble(Ihandle* ih, const char* name);
;; void      IupGetRGB      (Ihandle* ih, const char* name, unsigned char *r, unsigned char *g, unsigned char *b);

;; void  IupSetAttributeId(Ihandle* ih, const char* name, int id, const char *value);

(defcfun (%iup-set-str-attribute-id "IupSetStrAttributeId") :void
  (handle ihandle)
  (name :string)
  (id :int)
  (value :string))

;; void  IupSetStrfId(Ihandle* ih, const char* name, int id, const char* format, ...);
;; void  IupSetIntId(Ihandle* ih, const char* name, int id, int value);
;; void  IupSetFloatId(Ihandle* ih, const char* name, int id, float value);
;; void  IupSetDoubleId(Ihandle* ih, const char* name, int id, double value);
;; void  IupSetRGBId(Ihandle* ih, const char* name, int id, unsigned char r, unsigned char g, unsigned char b);

;; char*  IupGetAttributeId(Ihandle* ih, const char* name, int id);
;; int    IupGetIntId(Ihandle* ih, const char* name, int id);
;; float  IupGetFloatId(Ihandle* ih, const char* name, int id);
;; double IupGetDoubleId(Ihandle* ih, const char* name, int id);
;; void   IupGetRGBId(Ihandle* ih, const char* name, int id, unsigned char *r, unsigned char *g, unsigned char *b);

;; void  IupSetAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* value);

(defcfun (%iup-set-str-attribute-id-2 "IupSetStrAttributeId2") :void
  (handle ihandle)
  (name :int)
  (line :int)
  (column :int)
  (value :string))

;; void  IupSetStrfId2(Ihandle* ih, const char* name, int lin, int col, const char* format, ...);
;; void  IupSetIntId2(Ihandle* ih, const char* name, int lin, int col, int value);
;; void  IupSetFloatId2(Ihandle* ih, const char* name, int lin, int col, float value);
;; void  IupSetDoubleId2(Ihandle* ih, const char* name, int lin, int col, double value);
;; void  IupSetRGBId2(Ihandle* ih, const char* name, int lin, int col, unsigned char r, unsigned char g, unsigned char b);

;; char*  IupGetAttributeId2(Ihandle* ih, const char* name, int lin, int col);
;; int    IupGetIntId2(Ihandle* ih, const char* name, int lin, int col);
;; float  IupGetFloatId2(Ihandle* ih, const char* name, int lin, int col);
;; double IupGetDoubleId2(Ihandle* ih, const char* name, int lin, int col);
;; void   IupGetRGBId2(Ihandle* ih, const char* name, int lin, int col, unsigned char *r, unsigned char *g, unsigned char *b);

;; void      IupSetGlobal  (const char* name, const char* value);
;; void      IupSetStrGlobal(const char* name, const char* value);
;; char*     IupGetGlobal  (const char* name);

;; Ihandle*  IupSetFocus     (Ihandle* ih);
;; Ihandle*  IupGetFocus     (void);
;; Ihandle*  IupPreviousField(Ihandle* ih);  
;; Ihandle*  IupNextField    (Ihandle* ih);

;; Icallback IupGetCallback (Ihandle* ih, const char *name);
;; Icallback IupSetCallback (Ihandle* ih, const char *name, Icallback func);
;; Ihandle*  IupSetCallbacks(Ihandle* ih, const char *name, Icallback func, ...);

;; Icallback IupGetFunction(const char *name);
;; Icallback IupSetFunction(const char *name, Icallback func);

;; Ihandle*  IupGetHandle    (const char *name);
;; Ihandle*  IupSetHandle    (const char *name, Ihandle* ih);
;; int       IupGetAllNames  (char** names, int n);
;; int       IupGetAllDialogs(char** names, int n);
;; char*     IupGetName      (Ihandle* ih);

;; void      IupSetAttributeHandle(Ihandle* ih, const char* name, Ihandle* ih_named);
;; Ihandle*  IupGetAttributeHandle(Ihandle* ih, const char* name);
;; void      IupSetAttributeHandleId(Ihandle* ih, const char* name, int id, Ihandle* ih_named);
;; Ihandle*  IupGetAttributeHandleId(Ihandle* ih, const char* name, int id);
;; void      IupSetAttributeHandleId2(Ihandle* ih, const char* name, int lin, int col, Ihandle* ih_named);
;; Ihandle*  IupGetAttributeHandleId2(Ihandle* ih, const char* name, int lin, int col);

;; char*     IupGetClassName(Ihandle* ih);
;; char*     IupGetClassType(Ihandle* ih);
;; int       IupGetAllClasses(char** names, int n);
;; int       IupGetClassAttributes(const char* classname, char** names, int n);
;; int       IupGetClassCallbacks(const char* classname, char** names, int n);
;; void      IupSaveClassAttributes(Ihandle* ih);
;; void      IupCopyClassAttributes(Ihandle* src_ih, Ihandle* dst_ih);
;; void      IupSetClassDefaultAttribute(const char* classname, const char *name, const char* value);
;; int       IupClassMatch(Ihandle* ih, const char* classname);

;; Ihandle*  IupCreate (const char *classname);
;; Ihandle*  IupCreatev(const char *classname, void* *params);
;; Ihandle*  IupCreatep(const char *classname, void* first, ...);

(defcfun (%iup-fill "IupFill") ihandle)
(defcfun (%iup-space "IupSpace") ihandle)

(defcfun (%iup-radio "IupRadio") ihandle
  (child ihandle))

(defcfun (%iup-vbox-v "IupVBoxv") ihandle
  (children :pointer))

(defcfun (%iup-zbox-v "IupZBoxv") ihandle
  (children :pointer))

(defcfun (%iup-hbox-v "IupHBoxv") ihandle
  (children :pointer))

(defcfun (%iup-normalizer-v "IupNormalizerv") ihandle
  (children :pointer))

(defcfun (%iup-cbox-v "IupCboxv") ihandle
  (children :pointer))

(defcfun (%iup-sbox "IupSbox") ihandle
  (child ihandle))

(defcfun (%iup-split "IupSplit") ihandle
  (child1 ihandle)
  (child2 ihandle))

(defcfun (%iup-scroll-box "IupScrollBox") ihandle
  (child ihandle))

(defcfun (%iup-flat-scroll-box "IupFlatScrollBox") ihandle
  (child ihandle))

(defcfun (%iup-gridbox-v "IupGridBoxv") ihandle
  (children :pointer))

(defcfun (%iup-expander "IupExpander") ihandle
  (child ihandle))

(defcfun (%iup-detach-box "IupDetachBox") ihandle
  (child ihandle))

(defcfun (%iup-background-box "IupBackgroundBox") ihandle
  (child ihandle))

(defcfun (%iup-frame "IupFrame") ihandle
  (child ihandle))

(defcfun (%iup-flat-frame "IupFlatFrame") ihandle
  (child ihandle))

;; Ihandle*  IupImage      (int width, int height, const unsigned char *pixmap);
;; Ihandle*  IupImageRGB   (int width, int height, const unsigned char *pixmap);
;; Ihandle*  IupImageRGBA  (int width, int height, const unsigned char *pixmap);

;; Ihandle*  IupItem       (const char* title, const char* action);
;; Ihandle*  IupSubmenu    (const char* title, Ihandle* child);
;; Ihandle*  IupSeparator  (void);
;; Ihandle*  IupMenu       (Ihandle* child, ...);
;; Ihandle*  IupMenuv      (Ihandle* *children);

;; Ihandle*  IupButton     (const char* title, const char* action);
;; Ihandle*  IupFlatButton (const char* title);
;; Ihandle*  IupFlatToggle (const char* title);
;; Ihandle*  IupDropButton (Ihandle* dropchild);
;; Ihandle*  IupFlatLabel  (const char* title);
;; Ihandle*  IupFlatSeparator(void);
;; Ihandle*  IupCanvas(const char* action);
;; Ihandle*  IupDialog     (Ihandle* child);
;; Ihandle*  IupUser       (void);
;; Ihandle*  IupLabel      (const char* title);
;; Ihandle*  IupList       (const char* action);
;; Ihandle*  IupText       (const char* action);
;; Ihandle*  IupMultiLine  (const char* action);
;; Ihandle*  IupToggle     (const char* title, const char* action);
;; Ihandle*  IupTimer      (void);
;; Ihandle*  IupClipboard  (void);
;; Ihandle*  IupProgressBar(void);
;; Ihandle*  IupVal        (const char *type);
;; Ihandle*  IupTabs       (Ihandle* child, ...);
;; Ihandle*  IupTabsv      (Ihandle* *children);
;; Ihandle*  IupFlatTabs   (Ihandle* first, ...);
;; Ihandle*  IupFlatTabsv  (Ihandle* *children);
;; Ihandle*  IupTree       (void);
;; Ihandle*  IupLink       (const char* url, const char* title);
;; Ihandle*  IupAnimatedLabel(Ihandle* animation);
;; Ihandle*  IupDatePick   (void);
;; Ihandle*  IupCalendar   (void);
;; Ihandle*  IupColorbar   (void);
;; Ihandle*  IupGauge      (void);
;; Ihandle*  IupDial       (const char* type);
;; Ihandle*  IupColorBrowser(void);

;; /* String compare utility */
;; int IupStringCompare(const char* str1, const char* str2, int casesensitive, int lexicographic);

;; /* IupImage utility */
;; int IupSaveImageAsText(Ihandle* ih, const char* file_name, const char* format, const char* name);

;; /* IupText and IupScintilla utilities */
;; void  IupTextConvertLinColToPos(Ihandle* ih, int lin, int col, int *pos);
;; void  IupTextConvertPosToLinCol(Ihandle* ih, int pos, int *lin, int *col);

;; /* IupText, IupList, IupTree, IupMatrix and IupScintilla utility */
;; int   IupConvertXYToPos(Ihandle* ih, int x, int y);

;; /* OLD names, kept for backward compatibility, will never be removed. */
;; void IupStoreGlobal(const char* name, const char* value);
;; void IupStoreAttribute(Ihandle* ih, const char* name, const char* value);
;; void IupSetfAttribute(Ihandle* ih, const char* name, const char* format, ...);
;; void IupStoreAttributeId(Ihandle* ih, const char* name, int id, const char *value);
;; void IupSetfAttributeId(Ihandle* ih, const char* name, int id, const char* f, ...);
;; void IupStoreAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* value);
;; void IupSetfAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* format, ...);

;; /* IupTree utilities */
;; int   IupTreeSetUserId(Ihandle* ih, int id, void* userid);
;; void* IupTreeGetUserId(Ihandle* ih, int id);
;; int   IupTreeGetId(Ihandle* ih, void *userid);
;; void  IupTreeSetAttributeHandle(Ihandle* ih, const char* name, int id, Ihandle* ih_named); /* deprecated, use IupSetA

(defcfun (%iup-file-dlg "IupFileDlg") ihandle)
(defcfun (%iup-message-dlg "IupMessageDlg") ihandle)
(defcfun (%iup-color-dlg "IupColorDlg") ihandle)
(defcfun (%iup-font-dlg "IupFontDlg") ihandle)
(defcfun (%iup-progress-dlg "IupProgressDlg") ihandle)


;; int  IupGetFile(char *arq);  // NB see docs on suppling memory buffer

(defcfun (%iup-message "IupMessage") :void
  (title :string)
  (message :string))

(defcfun (%iup-message-error "IupMessageError") :void
  (title :string)
  (message :string))

;; int IupMessageAlarm(Ihandle* parent, const char* title, const char *message, const char *buttons);

;; int  IupAlarm(const char *title, const char *msg, const char *b1, const char *b2, const char *b3);
;; int  IupScanf(const char *format, ...);
;; int  IupListDialog(int type, const char *title, int size, const char** list,
;;                    int op, int max_col, int max_lin, int* marks);
;; int  IupGetText(const char* title, char* text, int maxsize);
;; int  IupGetColor(int x, int y, unsigned char* r, unsigned char* g, unsigned char* b);

;; typedef int (*Iparamcb)(Ihandle* dialog, int param_index, void* user_data);
;; int IupGetParam(const char* title, Iparamcb action, void* user_data, const char* format, ...);
;; int IupGetParamv(const char* title, Iparamcb action, void* user_data, const char* format, int param_count, int param_extra, void** param_data);
;; Ihandle* IupParam(const char* format);
;; Ihandle*  IupParamBox(Ihandle* param, ...);
;; Ihandle*  IupParamBoxv(Ihandle* *param_array);

;; Ihandle* IupLayoutDialog(Ihandle* dialog);
;; Ihandle* IupElementPropertiesDialog(Ihandle* elem);

;; /************************************************************************/
;; /*                   Common Flags and Return Values                     */
;; /************************************************************************/
;; #define IUP_ERROR     1
;; #define IUP_NOERROR   0
;; #define IUP_OPENED   -1
;; #define IUP_INVALID  -1
;; #define IUP_INVALID_ID -10


;; /************************************************************************/
;; /*                   Callback Return Values                             */
;; /************************************************************************/
;; #define IUP_IGNORE    -1
;; #define IUP_DEFAULT   -2
;; #define IUP_CLOSE     -3
;; #define IUP_CONTINUE  -4

;; /************************************************************************/
;; /*           IupPopup and IupShowXY Parameter Values                    */
;; /************************************************************************/
;; #define IUP_CENTER        0xFFFF  /* 65535 */
;; #define IUP_LEFT          0xFFFE  /* 65534 */
;; #define IUP_RIGHT         0xFFFD  /* 65533 */
;; #define IUP_MOUSEPOS      0xFFFC  /* 65532 */
;; #define IUP_CURRENT       0xFFFB  /* 65531 */
;; #define IUP_CENTERPARENT  0xFFFA  /* 65530 */
;; #define IUP_TOP       IUP_LEFT
;; #define IUP_BOTTOM    IUP_RIGHT

;; /************************************************************************/
;; /*               SHOW_CB Callback Values                                */
;; /************************************************************************/
;; enum{IUP_SHOW, IUP_RESTORE, IUP_MINIMIZE, IUP_MAXIMIZE, IUP_HIDE};

;; /************************************************************************/
;; /*               SCROLL_CB Callback Values                              */
;; /************************************************************************/
;; enum{IUP_SBUP,   IUP_SBDN,    IUP_SBPGUP,   IUP_SBPGDN,    IUP_SBPOSV, IUP_SBDRAGV, 
;;      IUP_SBLEFT, IUP_SBRIGHT, IUP_SBPGLEFT, IUP_SBPGRIGHT, IUP_SBPOSH, IUP_SBDRAGH};

;; /************************************************************************/
;; /*               Mouse Button Values and Macros                         */
;; /************************************************************************/
;; #define IUP_BUTTON1   '1'
;; #define IUP_BUTTON2   '2'
;; #define IUP_BUTTON3   '3'
;; #define IUP_BUTTON4   '4'
;; #define IUP_BUTTON5   '5'

;; #define iup_isshift(_s)    (_s[0]=='S')
;; #define iup_iscontrol(_s)  (_s[1]=='C')
;; #define iup_isbutton1(_s)  (_s[2]=='1')
;; #define iup_isbutton2(_s)  (_s[3]=='2')
;; #define iup_isbutton3(_s)  (_s[4]=='3')
;; #define iup_isdouble(_s)   (_s[5]=='D')
;; #define iup_isalt(_s)      (_s[6]=='A')
;; #define iup_issys(_s)      (_s[7]=='Y')
;; #define iup_isbutton4(_s)  (_s[8]=='4')
;; #define iup_isbutton5(_s)  (_s[9]=='5')

;; /* Old definitions for backward compatibility */
;; #define isshift     iup_isshift
;; #define iscontrol   iup_iscontrol
;; #define isbutton1   iup_isbutton1
;; #define isbutton2   iup_isbutton2
;; #define isbutton3   iup_isbutton3
;; #define isdouble    iup_isdouble
;; #define isalt       iup_isalt
;; #define issys       iup_issys
;; #define isbutton4   iup_isbutton4
;; #define isbutton5   iup_isbutton5


;; /************************************************************************/
;; /*                      Pre-Defined Masks                               */
;; /************************************************************************/
;; #define IUP_MASK_FLOAT       "[+/-]?(/d+/.?/d*|/./d+)"
;; #define IUP_MASK_UFLOAT            "(/d+/.?/d*|/./d+)"
;; #define IUP_MASK_EFLOAT      "[+/-]?(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?"
;; #define IUP_MASK_UEFLOAT           "(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?"
;; #define IUP_MASK_FLOATCOMMA  "[+/-]?(/d+/,?/d*|/,/d+)"
;; #define IUP_MASK_UFLOATCOMMA       "(/d+/,?/d*|/,/d+)"
;; #define IUP_MASK_INT          "[+/-]?/d+"
;; #define IUP_MASK_UINT               "/d+"

;; /* Old definitions for backward compatibility */
;; #define IUPMASK_FLOAT     IUP_MASK_FLOAT
;; #define IUPMASK_UFLOAT    IUP_MASK_UFLOAT
;; #define IUPMASK_EFLOAT    IUP_MASK_EFLOAT
;; #define IUPMASK_INT	      IUP_MASK_INT
;; #define IUPMASK_UINT      IUP_MASK_UINT


;; /************************************************************************/
;; /*                   IupGetParam Callback situations                    */
;; /************************************************************************/
;; #define IUP_GETPARAM_BUTTON1 -1
;; #define IUP_GETPARAM_INIT    -2
;; #define IUP_GETPARAM_BUTTON2 -3
;; #define IUP_GETPARAM_BUTTON3 -4
;; #define IUP_GETPARAM_CLOSE   -5
;; #define IUP_GETPARAM_MAP     -6
;; #define IUP_GETPARAM_OK     IUP_GETPARAM_BUTTON1
;; #define IUP_GETPARAM_CANCEL IUP_GETPARAM_BUTTON2
;; #define IUP_GETPARAM_HELP   IUP_GETPARAM_BUTTON3

;; /************************************************************************/
;; /*                   Used by IupColorbar                                */
;; /************************************************************************/
;; #define IUP_PRIMARY -1
;; #define IUP_SECONDARY -2

;; /************************************************************************/
;; /*                   Record Input Modes                                 */
;; /************************************************************************/
;; enum {IUP_RECBINARY, IUP_RECTEXT};


;; /************************************************************************/
;; /*              Replacement for the WinMain in Windows,                 */
;; /*        this allows the application to start from "main".             */
;; /*        Used only for Watcom.                                         */
;; /************************************************************************/
;; #if defined (__WATCOMC__)
;; #ifdef __cplusplus
;; extern "C" {
;; int IupMain (int argc, char** argv); /* In C++ we have to declare the prototype */
;; }
;; #endif
;; #define main IupMain /* this is the trick for Watcom and MetroWerks */
;; #endif










(defcfun (%iup-label "IupLabel") ihandle
  (title :string))

(defcfun (%iup-dialog "IupDialog") ihandle
  (child ihandle))

(defcfun (%iup-button "IupButton") ihandle
  (title :string)
  (action :pointer))
