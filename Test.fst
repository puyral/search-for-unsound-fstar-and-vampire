module Test
#push-options "--log_queries"

irreducible
let f (x:nat) = x

let g (_:unit) = 
    assert (f 2 == f 3 + f 1)