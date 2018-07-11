# Chapter 3 Exercises

## Exercise 1: Scope (3.4)

### 1

These lines of code are from a REPL session. Is 𝑦 in scope for 𝑧?

```haskell
    Prelude> let x = 5
    Prelude> let y = 7
    Prelude> let z = x * y
```
*Answer:*

Yes, all are defined in the same scope

### 2

These lines of code are from a REPL session. Is ℎ in scope for 𝑔? Go with your gut here.

```haskell
    Prelude> let f = 3
    Prelude> let g = 6 * f + h
```

*Answer:*

No, this won't compile as h isn't defined

### 3

This code sample is from a source file. Is everything we need to execute area in scope?

```haskell
    area d = pi * (r * r)
    r = d / 2
```

*Answer:*

No, as the d in the function is of a different scope than the d in the definition of r

### 4

This code is also from a source file. Now are 𝑟 and 𝑑 in scope for area?
```haskell
area d = pi * (r * r)
        where r = d / 2
```
*Answer:*

Yes, as  ```where``` "extents" the scope. ```where``` makes the funciton equivelent to ```area d = pi * (d/2 * d/2)```



## Exercise 2: Syntax errors (3.5)

Read the syntax of the following functions and decide whether it will compile. Test them in your REPL and try to fix the syntax errors where they occur.
```haskell
1.   ++ [1, 2, 3] [4, 5, 6]  -- This will not compile as the ++ operator is not prefix in this context
2.  '<3' ++ ' Haskell' -- This will compile as the ++ operator is used correctly and both items are of the same time (charlists)
3.  concat ["<3", " Haskell"] -- This will also compile, as the prefix concat is used correctly, and both items are of the same type

```

## Chapter Exercises: Reading Syntax (3.8)

### 1

For the following lines of code, read the syntax carefully and decide if they are written correctly. Test them in your REPL after you’ve decided to check your work. Correct as many as you can.

```haskell
    a) concat [[1, 2, 3], [4, 5, 6]]    -- Correct
    b) ++ [1, 2, 3] [4, 5, 6]           -- Incorrect, (++) [1, 2, 3] [4, 5, 6]
    c) (++) "hello" " world"            -- Correct
    d) ["hello" ++ " world]             -- Incorrect, ["hello" ++ " world"]
    e) 4 !! "hello"                     -- Incorrect, "hello" !! 4
    f) (!!) "hello" 4                   -- Correct
    g) take "4 lovely"                  -- Incorrect, take 4 "lovely"
    h) take 3 "awesome"                 -- Correct
```
### 2

Next we have two sets: the first set is lines of code and the other is a set of results. Read the code and figure out which results came from which lines of code. Be sure to test them in the REPL.
```haskell
    a) concat [[1 * 6], [2 * 6], [3 * 6]]
    b) "rain" ++ drop 2 "elbow"
    c) 10 * head [1, 2, 3]
    d) (take 3 "Julie") ++ (tail "yes")
    e) concat [tail [1, 2, 3],
    tail [4, 5, 6],
    tail [7, 8, 9]]
```

Can you match each of the previous expressions to one of these results presented in a scrambled order?
 ```haskell
    a) "Jules"          -d
    b) [2,3,5,6,8,9]    -e
    c) "rainbow"        -b
    d) [6,12,18]        -a
    e) 10               -c
```

## Building Functions

Given the list-manipulation functions mentioned in this chapter, write functions that take the following inputs and return the expected outputs. Do them directly in your REPL and use the take and drop functions you’ve already seen.

```haskell
a)  -- Given
    "Curry is awesome"
    -- Return
    "Curry is awesome!"
```
```haskell
    dropLast m = take x m
        where x = (length m) - 1  -- Proud of this function :)
```
```haskell
b)  -- Given
    "Curry is awesome!"
    -- Return
    "y"
```
```haskell
fifthChar x = x !! 4
```
```haskell
c)  -- Given
    "Curry is awesome!"
    -- Return
    "awesome!"
```
```haskell
    lastEightChars x = drop m x
             where m = (length x) - 8 
```