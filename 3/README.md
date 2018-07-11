# Chapter 3 Exercises

## Exercise 1: Scope (3.4)

###1

These lines of code are from a REPL session. Is 𝑦 in scope for 𝑧?

```haskell
    Prelude> let x = 5
    Prelude> let y = 7
    Prelude> let z = x * y
```
*Answer:*

Yes, all are defined in the same scope

###2

These lines of code are from a REPL session. Is ℎ in scope for 𝑔? Go with your gut here.

```haskell
    Prelude> let f = 3
    Prelude> let g = 6 * f + h
```

*Answer:*

No, this won't compile as h isn't defined

###3

This code sample is from a source file. Is everything we need to execute area in scope?

```haskell
    area d = pi * (r * r)
    r = d / 2
```

*Answer:*

No, as the d in the function is of a different scope than the d in the definition of r

###4

This code is also from a source file. Now are 𝑟 and 𝑑 in scope for area?
```haskell
area d = pi * (r * r)
        where r = d / 2
```
*Answer:*

Yes, as  ```where``` "extents" the scope. ```where``` makes the funciton equivelent to ```area d = pi * (d/2 * d/2)```



##Exercise 2: Syntax errors (3.5)

Read the syntax of the following functions and decide whether it will compile. Test them in your REPL and try to fix the syntax errors where they occur.
```haskell
1.   ++ [1, 2, 3] [4, 5, 6]  
-- This will not compile as the ++ operator is not prefix in this context
2.  '<3' ++ ' Haskell'       -- This will compile as the ++ operator is used correctly and both items are of the same time (charlists)
3.  concat ["<3", " Haskell"]-- This will also compile, as the prefix concat is used correctly, and both items are of the same type

```