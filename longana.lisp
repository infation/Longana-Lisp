(load "board.lisp")

(defun print_hand(human_hand)
    (princ "Human Hand: ")
    (print_tiles human_hand)
    (terpri)
)

(defun play(hand board (print_hand hand))
    ( let* ( 
            (
                tileToPlay
                (get_at (- (readnum (length hand)) 1) hand)
            ))
    
        (cond 
            ( (null hand) )
            ( (not (check_left_rules tileToPlay board))
                (play hand board (print_hand hand)))
            ( t
                
                    (play (remove tileToPlay hand :test #'equal)
                        (add_to_board tileToPlay board "L") (print_hand (remove tileToPlay hand :test #'equal)))
            )
        )
    )
)

(defun readnum (size)
  (princ "Please Enter a number in the range 1-")
  (princ size)
  (terpri)
  (valid (read) size)  )

(defun valid (num size)
  (cond ( ( < num 1 )
          (readnum size)  )
        ( ( > num size )
          (readnum size)  )
        ( t num )) ) 

;(print_tiles ( shuffle (create_deck 0 0) 0))
( let* (
        (
            deck 
            (initialize_deck 0 0)
            
        )
        (
            human_hand
            (draw_hand deck 0 0)
        ) 
        (  
            computer_hand
            (draw_hand deck 0 1)
        )
        (
            deck
            (remove_tiles 16 deck)
        )
        (
            board
            ()
        )
     )
    ;(print_tiles (remove '(1 1) deck :test #'equal))
    ;(terpri)
    ;(print_tiles (draw_hand deck 0 0))


    (play human_hand board (print_hand human_hand))
)
;(print (list 1 2 3))
