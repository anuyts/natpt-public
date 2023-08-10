## Remarks
- loc or quotient is always leftmost
- core or top is always rightmost

## Generating chains
We have the following chains of adjoints:

### Change of anpolarity
- loc @ n
- forgetsym @ n
- core @ n

### Omission & insertion
- ...
- discrete insertion @ n-1 (if n-1 and n are symmetric)
- coagulation @ n (if n-1 is symmetric; replace n-1 with loc of n; remove n)
  - = omission @ n-1 if n is symmetric
  - quotient out n if n = 0
- discrete insertion @ n (always; loc of n-1, or equality if n = 0)
- omission @ n (always)
- codiscrete insertion @ n (always; core of n+1, or top if n = max)
- separation @ n (if n+1 is symmetric; replace n+1 with core of n; remove n)
  - = omission @ n+1 if n is symmetric
- discrete insertion @ n+1 (if n and n+1 are symmetric)
- ...

## General modalities
Modality from a to b is a certain mapping
`{=, jet_0, ..., jet_bmax} -> {=, equijet/jet/ripple_0, ..., equijet/jet/ripple_amax, top}`.

It is central if:

- it preserves `=` (does not quotient)
- it does not mention equijet
- it does not mention ripple
- it does not mention top

It is left/right if its right/left adjoint is central.

### INTRACTABLE
It is left if:

- it does not mention ripple
- it does not mention top
- it does not forget the last relation
- it does not fully forget symmetry of a relation which it does retain

It is right if:

- it preserves `=` (does not quotient)
- it does not mention equijet
- it does not mention `=` other than as the image of `=`
- it does not fully forget symmetry of a relation which it does retain
- it does not forget jet_n unless the previous retained relation is symmetric ...

