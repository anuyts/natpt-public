- Big degree 1 is where the magic happens.

- Big degree 0 should be discrete for closed types, and encodes the
  'graph' of big degree 1 stuff. Discreteness at closed types
  guarantees that the reflexive:
  
   - 1-path is the identity isomorphism
  
   - 1-jet is the identity morphism
  
   - 1-bridge is the **strict** equality relation
  
  at any type.

- Universe gets discrete big degree 0 by moving all other stuff one
  slot.

- Higher degrees get their meaning of pro-something automatically.

- Mixed-polar operations:
  
   - Will ask a path in order to produce a jet.
  
   - Can still produce a bridge if you give them a bridge.
  
  This is an argument to have both bridges and paths.

- Isopolar functions probably don't occur much: we have naturality
  instead.

- You can leave out bridges. Then there is no strict equality relation
  (at least not along bridges; we do have strict equality along
  functions and bijections), but mixed-variant functions can still
  preserve suc-paths.
  
   - If you leave out bridges, then data types which only have big
     degree 0, have no heterogeneous equality along bridges, only
     along morphisms and isos, so you've lost parametricity.

- You cannot leave out both bridges and paths, because then there is
  no mixed-variance.

- You can leave out paths but not bridges. Then there is strict
  equality, but no HoTT.

- Its never really HoTT, because an iso in the universe is up to
  strict equality.

- Alternatively, you can let big degree 0 correspond to 1-paths
  entirely (and probably not have bridges).
