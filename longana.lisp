(load "board.lisp")

(defun play(hand board)
    (cond ( (null hand) )
          ( t
            (readnum (length hand))
            (play (remove (first hand) hand :test #'equal)
                   (add_to_board (first hand) board "L"))
          )
    )
    ;(readnum (size hand))
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
    (princ "Deck: ")
    (print_tiles deck)
    (terpri)
    (princ "Human Hand: ")
    (print_tiles human_hand)
    (terpri)
    (princ "Computer Hand: ")
    (print_tiles computer_hand)
    (terpri)
    (play human_hand board)
)
;(print (list 1 2 3))
