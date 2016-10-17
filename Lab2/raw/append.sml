fun reverse xs =
let reverse_aux (x::xs) ys = reverse_aux xs (x::ys)
  | reverse_aux [] ys = ys
in reverse_aux xs []


fun append xs ys =
let 
  fun append_aux (x::xs) ys zs = append_aux xs ys (x::zs)
    | append_aux [] ys zs = (reverse zs)::ys
in append_aux xs ys [];

fun suffixes xs =
let 
  fun suffixes_aux xs ys = suffixes_aux (tl xs) xs::ys
    | suffixes_aux [] ys = reverse ys
in suffixes_aux xs []
