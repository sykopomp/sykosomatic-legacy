;; Copyright 2008-2010 Kat Marchán

;; This file is part of sykosomatic

;; sykosomatic is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; sykosomatic is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.

;; You should have received a copy of the GNU Affero General Public License
;; along with sykosomatic.  If not, see <http://www.gnu.org/licenses/>.

;; game.lisp
;;
;; Implements a basic game
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(in-package :sykosomatic)

(declaim (optimize debug))

;;;
;;; Test game
;;;
(defclass game (engine)
  ()
  (:default-initargs
   :providers (list (make-instance 'tcp-service-provider))))

(defun pick-default-location ()
  (let ((response (get-document *db* "_design/locations/_view/by_id")))
    (awhen (car (hashget response "rows"))
      (make-instance 'location :document (get-document *db* (hashget it "key"))))))

(defun play-game (client)
  (handle-player-command (soul client) (last-input client)))

(defmethod init ((game game))
  (setf *body-id->soul* (make-hash-table :test #'equal))
  (load-vocabulary))

(defmethod run :around ((game game))
  (let ((*default-client-main* #'play-game)
        (*default-location* (pick-default-location)))
    (call-next-method)))

(defmethod handle-player-command ((soul soul) input &aux (input (string-cleanup input)))
  (when (string-equal input "quit")
    (let ((location-id (location (body soul))))
      (when location-id
        (broadcast-to-location (make-instance 'location :document (get-document *db* location-id))
                               "~&~A leaves the world~%" (name (body soul)))))
    (disconnect (client soul) :close))
  (handler-case
      (invoke-syntax-tree (parse-string input)
                          (body soul))
    (parser-error (e)
      (format (client soul) "~&Got a parser error: ~A~%" e))))

(defun main ()
  (run (make-instance 'game)))
