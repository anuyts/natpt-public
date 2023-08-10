## Bridges and Paths

- Paths are for commodity
  - With paths, you have HoTT out of the box but must restrict to Rezk types
  - Without paths, you have to build HoTT from NatTT
- Bridges are for strictness
  - 0-bridges are strict equality, 1-bridges are relatedness
  - 1-paths are isomorphism (weak equality), 2-paths are pro-isomorphism
- When jets are symmetric, they should coincide with paths. I think bridges can still be separate.
  
## Degree interpretations for weak NatTT (NatHoTT)
```
-1      path    equivalence along a 0-path (weak mutual mapping)
-1      jet     equivalence along a 0-jet (weak mapping)
0       path    equivalence
0       jet     morphism
1       path    pro-equivalence
1       jet     pro-arrow
2       path    pro-pro-equivalence
2       jet     pro-pro-arrow
etc
```
Remarks

- Whenever a 0-path lives along a 0-jet/0-path, it can be uniquely promoted to a -1-jet/-1-path.

## Degree interpretations for strict NatTT
```
-1      path    equality along a 0-path (strict mutual mapping)
-1      jet     equality along a 0-jet (strict mapping)
-1      bridge  equality
0       path    isomorphism
0       jet     morphism
0       bridge  relation / pro-equality
1       path    pro-isomorphism
1       jet     pro-arrow
1       bridge  pro-relation
2       path    pro-pro-isomorphism
2       jet     pro-pro-arrow
2       bridge  pro-pro-relation
etc
```
Remarks

- Whenever a -1-bridge lives along a 0-jet/0-path, it can be uniquely promoted to a -1-jet/-1-path.
