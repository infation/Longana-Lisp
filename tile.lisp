(defun print_tile (pips)
    (princ (first pips))
    (princ "-")
    (princ (first(rest pips))))

(defun sum (pips)
     (+ (first pips) (first(rest pips))))

(defun is_double (pips)
        (equal (first pips) (first(rest pips))))

(defun initialize_deck (pip1 pip2)
    (cond ( (and (= pip1 7) (= pip2 7))
            ())
          ( (= pip2 6)
            (append (initialize_deck (+ pip1 1) (+ pip1 1)) (list(list pip1 pip2))) )
          ( t
            (shuffle (append (initialize_deck pip1 (+ pip2 1)) (list(list pip1 pip2))) ))))

(defun shuffle(deck) 
    ;(print_deck deck)
    (cond ( (= (random 200 (make-random-state t)) 56)
            (append deck nil))
          ( t 
            ( let*(
                    ( 
                      pip2
                      (random 7)
                    )
                    (
                      pip1
                      (random (+ pip2 1))
                    )
                  )  
              ( shuffle ( cons ( list pip1 pip2)
                               ( remove (list pip1 pip2) deck :test #'equal)
                        )
              )
             )
            )
          )
)      

(defun get_at(pos vector)
    (cond ((= pos 0)
        (first vector))
    (t
        ( get_at (- pos 1) (rest vector))
    )
    )
)

(defun remove_tiles(numElements vector)
    (cond ( (= numElements 0)
           vector)
          ( t 
            (remove_tiles (- numElements 1) (rest vector))
          )
    )
)

(defun draw_hand(deck iteration playerIndex)
    (cond ( (= iteration 8)
            ())
          ( (= playerIndex 0)
             (cons (first deck) (draw_hand (rest(rest deck)) (+ iteration 1) 0)))
          ( (= playerIndex 1)
             (cons (first (rest deck)) (draw_hand (rest(rest deck)) (+ iteration 1) 1)))
          ( t
          deck)))

(defun print_tiles(vector)
    (cond ( (null vector)
            )   
          ( t
            (print_tile (first vector))
            (princ " ")
            (print_tiles(rest vector)) )))
