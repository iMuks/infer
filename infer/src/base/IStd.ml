(*
 * Copyright (c) 2016 - present Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *)

include Core.Std

let ( @ ) = Caml.List.append

(* Use Caml.Set since they are serialized using Marshal, and Core.Std.Set includes the comparison
   function in its representation, which Marshal cannot (de)serialize. *)
module IntSet = Caml.Set.Make(Int)


(* Compare police: generic compare mostly disabled. *)
let compare = No_polymorphic_compare.compare
let equal = No_polymorphic_compare.equal


let failwithf fmt =
  Format.kfprintf (fun _ -> failwith (Format.flush_str_formatter ()))
    Format.str_formatter fmt

let invalid_argf fmt =
  Format.kfprintf (fun _ -> invalid_arg (Format.flush_str_formatter ()))
    Format.str_formatter fmt
