(load "tile.lisp")

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
     )
    ;(print_tiles (remove '(1 1) deck :test #'equal))
    ;(terpri)
    ;(print_tiles (draw_hand deck 0 0))
    (print "Deck: ")
    (print_tiles deck)
    (terpri)
    (print "Human Hand: ")
    (print_tiles human_hand)
    (terpri)
    (print "Computer Hand:")
    (print_tiles computer_hand)
)
;(print (list 1 2 3))
