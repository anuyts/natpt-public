## Synthesis paper scribbling yesterday

### What should our modes look like?

- optimal modal annotation when a variable is used multiple times with different modality, asks for **meets**. This is how we get **mixed-variance**.
   - to have meets for central modalities, every directed degree must be **preceded by a symmetric degree**.
      - ideally, it should express isomorphism
   - the nullary case is that there must be a maximal polarized degree, i.e. the **highest degree must be symmetric**.
      - ideally, it should express "true"
- if you have something in the domain, you still want to know what you get in the codomain. This is answered by looking it up in the right adjoint. So the right adjoint should not mention equijets/mixpol. So the left adjoint should satisfy eq (2.13), which for central modalities says that if you skip a degree j, then the first mention of a degree >j, should be at a symmetric degree i. I think this boils down to saying that if you map something symmetric to i-jets, then you should even map it to i-paths.
   - Since meets at directed degrees, can reduce the degree (going from jets to paths), every directed degree needs to be immediately followed by a symmetric degree. (This is a necessary but insufficient condition. That's ok: the requirement is desirable but unnecessary.)

### Strictness: all or nothing

Suppose that at storey 1 you have paths and then jets.
Then a 1-path gives you two 1-jets and squares expressing that they are mutually inverse.
These are squares of 1-jets, which contain squares of 0-jets. These 0-jet squares can then be transported to the target of the square, becoming homogeneous.
So a 1-path expresses an isomorphism where the equations are 0-infrajets.
So as soon as you have a system where 0-jets express strict equality, that strict equality is everywhere.

**Note:** The point of strict equality is that it's strict, and that it means equality. You don't need it in your base category, an equality dimension is an absent dimension. (Well not if it's heterogeneous!) Equality can be internalized using modalities referring to degree eq.

### Interpretation of degrees

####  Equivalence-aware NatPT

* Need a non-fibrant type to express strict equality (that's ok - this is exactly what Voevodsky proposed).

|        | data : type | type : kind | kind : sort | sort : genus  |
| ------ | ----------- | ----------- | ----------- | ------------- |
| 0-path | strict eq   | isomorphism | equivalence | 2-equivalence |
| 0-jet  | strict eq   | isomorphism | equivalence | 2-equivalence |
| 1-path | strict eq   | isomorphism | equivalence | 2-equivalence |
| 1-jet  |             | morphism    | morphism    | morphism      |
| 2-path |             | relation    | pro-iso     | pro-equiv     |
| 2-jet  |             |             | pro-arrow   | pro-arrow     |
| 3-path |             |             | pro-rel     | pro-pro-iso   |
| 3-jet  |             |             |             | pro-pro-arrow |
| 4-path |             |             |             | pro-pro-rel   |

#### Isomorphism-aware Non-strict NatPT

* Equivalences are not preserved by mixed-variant functions.

|        | data : type | type : kind | kind : sort | sort : genus  |
| ------ | ----------- | ----------- | ----------- | ------------- |
| 0-path | strict eq   | strict eq   | strict eq   | strict eq     |
| 0-jet  | strict eq   | strict eq   | strict eq   | strict eq     |
| 1-path | strict eq   | isomorphism | isomorphism | isomorphism   |
| 1-jet  |             | morphism    | morphism    | morphism      |
| 2-path |             | relation    | relation    | relation      |
| 2-jet  |             |             | pro-arrow   | pro-arrow     |
| 3-path |             |             | pro-rel     | pro-rel       |
| 3-jet  |             |             |             | pro-pro-arrow |
| 4-path |             |             |             | pro-pro-rel   |

Note that the reflexive 2-path is the isomorphism relation, **not** the equality relation.

#### Isomorphism-unaware Strict NatPT (Weird)

* Equivalences & isomorphisms are not preserved by mixed-variant functions.

|        | data : type | type : kind | kind : sort | sort : genus  |
| ------ | ----------- | ----------- | ----------- | ------------- |
| 0-path | strict eq   | strict eq   | strict eq   | strict eq     |
| 0-jet  | strict eq   | strict eq   | strict eq   | strict eq     |
| 1-path | strict eq   | strict eq   | strict eq   | strict eq     |
| 1-jet  |             | morphism    | morphism    | morphism      |
| 2-path |             | relation    | relation    | relation      |
| 2-jet  |             |             | pro-arrow   | pro-arrow     |
| 3-path |             |             | pro-rel     | pro-rel       |
| 3-jet  |             |             |             | pro-pro-arrow |
| 4-path |             |             |             | pro-pro-rel   |

It requires an odd tour-de-force to keep 1-paths strict.

#### Isomorphism-aware Strict NatPT

- Equivalences are not preserved by mixed-variant functions.

|          | data : type | type : kind | kind : sort     | sort : genus    |
| -------- | ----------- | ----------- | --------------- | --------------- |
| 0-path   | strict eq   | strict eq   | strict eq       | strict eq       |
| 0-jet    | strict eq   | strict eq   | strict eq       | strict eq       |
| 0-bridge | strict eq   | strict eq   | strict eq       | strict eq       |
| 1-path   |             | isomorphism | isomorphism (!) | isomorphism (!) |
| 1-jet    |             | morphism    | morphism        | morphism        |
| 1-bridge |             | relation    | relation        | relation        |
| 2-path   |             |             | pro-iso         | pro-iso         |
| 2-jet    |             |             | pro-arrow       | pro-arrow       |
| 2-bridge |             |             | pro-rel         | pro-rel         |
| 3-path   |             |             |                 | pro-pro-iso     |
| 3-jet    |             |             |                 | pro-pro-arrow   |
| 3-bridge |             |             |                 | pro-pro-rel     |

## Brain dump yesterday (26/06/2024)

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
