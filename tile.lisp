(defun print_tile (pips)
    (princ (first pips))
    (princ "-")
    (princ (first(rest pips))))

(defun sum (pips)
     (+ (first pips) (first(rest pips))))

(defun is_double (pips)
        (equal (first pips) (first(rest pips))))

(defun create_deck (pip1 pip2)
    (cond ( (and (= pip1 7) (= pip2 7))
            ())
          ( (= pip2 6)
            (append (create_deck (+ pip1 1) (+ pip1 1)) (list(list pip1 pip2))) )
          ( t
            (append (create_deck pip1 (+ pip2 1)) (list(list pip1 pip2))) )))

(defun shuffle(deck iteration) 
    ;(print_deck deck)
    (cond ( (< iteration 500)
            (shuffle (append_at 0 (random 28) deck) (+ iteration 1)))

          ( t 
             deck)))

(defun draw_hand(deck iteration playerIndex)
    (cond ( (= iteration 8)
            ())
          ( (= playerIndex 0)
             (append (list(first deck)) (draw_hand (rest(rest deck)) (+ iteration 1) 0)))
          ( (= playerIndex 1)
             (append (list (first (rest deck))) (draw_hand (rest(rest deck)) (+ iteration 1) 1)))
          ( t
          deck)))


(defun append_at(index dest vector)
    (cond ( (= index dest)
            (append (rest vector) (list(first vector))))
          ( t 
            (append (list(first vector)) (append_at (+ index 1) dest (rest vector)) )))
            
)



(defun print_tiles(vector)
    (cond ( (null vector)
            )
          ( t
            (print_tile (first vector))
            (princ " ")
            (print_tiles(rest vector)) )))
