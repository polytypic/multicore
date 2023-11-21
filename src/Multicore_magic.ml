include Padding
module Transparent_atomic = Transparent_atomic

let[@inline] fenceless_get (atomic : 'a Atomic.t) = !(Obj.magic atomic : 'a ref)

let[@inline] fenceless_set (atomic : 'a Atomic.t) value =
  (Obj.magic atomic : 'a ref) := value

let[@inline] fence atomic = Atomic.fetch_and_add atomic 0 |> ignore
