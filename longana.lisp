(load "tile.lisp")

;(print_tiles ( shuffle (create_deck 0 0) 0))
(let (
        (
            deck 
            (shuffle (create_deck 0 0) 0)
        )
     )
    (print_tiles deck)
    (terpri)
    (print_tiles (draw_hand deck 0 0))
    (terpri)
    (print_tiles (draw_hand deck 0 1))
)
;(print (list 1 2 3))
