;; This file is part of sykosomatic

(asdf:defsystem #:sykosomatic
  :name "SykoSoMaTIC"
  :author "Kat M <kzm@sykosomatic.org>"
  :version "nil"
  :maintainer "Kat M <kzm@sykosomatic.org>"
  :description "Sykopomp's Somewhat Masterful Text in Console"
  :long-description "A heavily-extensible, simple, powerful text-based online game engine."
  :license "GPLv3, see COPYING"
  :depends-on (#:cl-ppcre #:cl-store #:usocket #:bordeaux-threads #:cl-cont #:ironclad #:xmls)
  :components 
  ((:module src
	    :serial t
	    :components
	    ((:file "packages")

	     (:module util
		      :serial t
		      :components
		      ((:file "config")
		       (:file "queue")
		       (:file "priority-queue")
		       (:file "xml-import")
		       (:file "logger")))
	     
	     (:module event
		      :serial t
		      :components
		      ((:file "event")))
	     
	     (:module network
		      :serial t
		      :components
		      ((:file "server")
		       (:file "client")))

	     (:module objects
		      :serial t
		      :components
		      ((:file "game-object")
		       (:file "room")
		       (:file "entity")
		       (:file "mobile")
		       (:file "item")
		       (:file "player")))

	     (:module parser
		      :serial t
		      :components
		      ((:file "vocabulary")
		       (:file "parser")))))))
