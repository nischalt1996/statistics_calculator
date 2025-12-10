let mean lst =
  let sum = List.fold_left (+) 0 lst in
  float_of_int sum /. float_of_int (List.length lst)

let median lst =
  let sorted = List.sort compare lst in
  let len = List.length sorted in
  if len mod 2 = 0 then
    let a = List.nth sorted (len/2 - 1) in
    let b = List.nth sorted (len/2) in
    (float_of_int a +. float_of_int b) /. 2.0
  else
    float_of_int (List.nth sorted (len/2))

let mode lst =
  let counts =
    List.fold_left
      (fun acc x ->
        if List.mem_assoc x acc then
          (x, (List.assoc x acc) + 1) :: List.remove_assoc x acc
        else
          (x, 1) :: acc)
      [] lst
  in
  let max_count = List.fold_left (fun acc (_, c) -> max acc c) 0 counts in
  List.filter (fun (_, c) -> c = max_count) counts
  |> List.map fst

let () =
  let data = [1; 2; 2; 3; 4; 5; 5; 5; 6; 7; 8; 9] in
  Printf.printf "Mean: %.2f\n" (mean data);
  Printf.printf "Median: %.2f\n" (median data);
  Printf.printf "Mode(s): ";
  List.iter (Printf.printf "%d ") (mode data);
  print_newline ()