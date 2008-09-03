;; Copyright 2008 Kat Marchan

;; This file is part of sykosomatic

;; sykosomatic is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; sykosomatic is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with sykosomatic.  If not, see <http://www.gnu.org/licenses/>.

(asdf:defsystem #:sykosomatic-tests
  :name "SykoSoMaTIC"
  :author "Rudolf Olah <omouse@gmail.com>"
  :version "nil"
  :maintainer "Rudolf Olah <omouse@gmail.com>"
  :description "Sykosomatic Testing"
  :long-description "The unit-tests for the sykosomatic MUD code."
  :depends-on (#:sykosomatic #:fiveam)
  :components ((:module "tests"
			:components ((:file "packages")
				     (:file "account")
				     (:file "xml-import")))
	       (:file "run-tests" :depends-on ("tests"))
	       ))