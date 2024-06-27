
## Synthesis paper scribbling yesterday

### What should our modes look like?
- optimal modal annotation when a variable is used multiple times with different modality, asks for **meets**. This is how we get **mixed-variance**.
  - to have meets for central modalities, every directed degree must be **preceded by a symmetric degree**.
    - ideally, it should express isomorphism
  - the nullary case is that there must be a maximal polarized degree, i.e. the **highest degree must be symmetric**.
    - ideally, it should express "true"
- if you have something in the domain, you still want to know what you get in the codomain. This is answered by looking it up in the right adjoint. So the right adjoint should not mention equijets/mixpol. So the left adjoint should satisfy eq (2.13), which for central modalities says that if you skip a degree j, then the first mention of a degree >j, should be at a symmetric degree i.
  - Since meets at directed degrees, can reduce the degree (going from jets to paths), every directed degree needs to be immediately followed by a symmetric degree. (This is a necessary but insufficient condition. That's ok: the requirement is desirable but unnecessary.)
  
### Strictness: all or nothing
Suppose that at floor 1 you have paths and then jets.
Then a 1-path gives you 2 1-jets and squares expressing that they are mutually inverse.
These are squares of 1-jets, which contain squares of 0-jets.
So a 1-path expresses an isomorphism where the equations are 0-infrajets.
So as soon as you have a system where 0-jets express strict equality, that strict equality is everywhere.

## Brain dump yesterday
- Big degree 1 is where the magic happens.
- Big degree 0 should be discrete for closed types, and encodes the 'graph' of big degree 1 stuff. Discreteness at closed types guarantees that the reflexive:
   - 1-path is the identity isomorphism
   - 1-jet is the identity morphism
   - 1-bridge is the **strict** equality relation
  at any type.
- Universe gets discrete big degree 0 by moving all other stuff one slot.
- Higher degrees get their meaning of pro-something automatically.
- Mixed-polar operations:
   - Will ask a path in order to produce a jet.
   - Can still produce a bridge if you give them a bridge.
  This is an argument to have both bridges and paths.
- Isopolar functions probably don't occur much: we have naturality instead.
- You can leave out bridges. Then there is no strict equality relation (at least not along bridges; we do have strict equality along functions and bijections), but mixed-variant functions can still preserve suc-paths.
   - If you leave out bridges, then data types which only have big degree 0, have no heterogeneous equality along bridges, only along morphisms and isos, so you've lost parametricity.
- You cannot leave out both bridges and paths, because then there is no mixed-variance.
- You can leave out paths but not bridges. Then there is strict equality, but no HoTT.
- Its never really HoTT, because an iso in the universe is up to strict equality.
- Alternatively, you can let big degree 0 correspond to 1-paths entirely (and probably not have bridges).
