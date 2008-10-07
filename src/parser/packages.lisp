;; Copyright 2008 Kat Marchan

;; This file is part of sykosomatic

(defpackage #:org.sykosomatic.parser
  (:use :cl :org.sykosomatic.util)
  (:export

   ;; vocabulary.lisp
   :*verbs*
   :*adverbs*
   :*articles*
   :*prepositions*
   :*pronouns*
   :*conjunctions*
   :*cardinal-numbers*
   :*ordinal-numbers*
   :*plural-exceptions*
   :save-vocabulary
   :load-vocabulary
   ;db management
   :add-verb
   :remove-verb
   :refresh-verb
   :add-emote
   
   ;;parser.lisp
   :parse-string
   :<sentence>
   :<noun-clause>
   :<noun-phrase>
   :parser-error
   :print-object))
