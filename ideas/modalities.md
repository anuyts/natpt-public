## Remarks
- loc or quotient is always leftmost
- core or top is always rightmost

## Generating chains
We have the following chains of adjoints:

### Change of anpolarity
- loc @ n
- forget @ n
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
