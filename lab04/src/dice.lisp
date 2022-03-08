(setf *random-state* (make-random-state T))

(defun roll-dice ()
    (list (+ (random 6) 1) (+ (random 6) 1)))

(defun dice-sum (dice)
    (apply #'+ dice))

(defun check-win (sum)
    (or (= sum 7) (= sum 11)))

(defun check-repeat (dice)
    (let ((f (car dice))
         (s (cadr dice)))
         (or (= f s 1) (= f s 6))))

(defun player-round (who)
    (let* ((player-dice (roll-dice))
           (player-sum (dice-sum player-dice)))
          (print who)
          (print player-dice)
          (cond ((check-win player-sum) Nil)
                ((check-repeat player-dice) (player-round who))
                (T player-sum))))

(defun dice ()
    (let ((first-sum (player-round "first")))
         (if (not first-sum)
             (print "First player is winner!")
             (let ((second-sum (player-round "second")))
                  (cond ((or (not second-sum) (< first-sum second-sum)) 
                            (print "Second player is winner!"))
                        ((> first-sum second-sum)
                            (print "First player is winner!"))
                        (T (print "Draw.")))))))

(dice)
