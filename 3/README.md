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

### 2

Now take each of the above and rewrite it in a source file as
a general function that could take different string inputs as
arguments but retain the same behavior. Use a variable as the
argument to your (named) functions. If you’re unsure how to
do this, refresh your memory by looking at the waxOff exercise
from the previous chapter and the TopOrLocal module from this
chapter

---
```haskell
    dropLast m = take x m
        where x = (length m) - 1

    fifthChar x = x !! 4

    lastEightChars x = drop m x
            where m = (length x) - 8 
```

### 3

Write a function of type String -> Char which returns the third
character in a String. Remember to give the function a name
and apply it to a variable, not a specific String, so that it could
be reused for different String inputs, as demonstrated (feel free
to name the function something else. Be sure to fill in the type
signature and fill in the function definition after the equals sign):

---
```haskell
    thirdLetter :: String -> Char
    thirdLetter x = x !! 2
```
### 4

Now change that function so the string operated on is always
the same and the variable represents the number of the letter
you want to return (you can use “Curry is awesome!” as your
string input or a different string if you prefer).

### 5

Using the take and drop functions we looked at above, see if you
can write a function called rvrs (an abbreviation of ‘reverse’ used
because there is a function called ‘reverse’ already in Prelude,
so if you call your function the same name, you’ll get an error
message). rvrs should take the string “Curry is awesome” and
return the result “awesome is Curry.” This may not be the most
lovely Haskell code you will ever write, but it is quite possible
using only what we’ve learned so far. First write it as a single
function in a source file. This doesn’t need to, and shouldn’t,
work for reversing the words of any sentence. You’re expected
only to slice and dice this particular string with take and drop.

---
```haskell
string :: String
string = "Curry is awesome"
rvrs :: String
rvrs = part3 ++ part2 ++ " " ++ part1
    where part1 = take 5 string
          part2 = take 3 $ drop 5 string
          part3 = drop 9 string
```

### 6
Let’s see if we can expand that function into a module. Why
would we want to? By expanding it into a module, we can add
more functions later that can interact with each other. We can
also then export it to other modules if we want to and use this
code in those other modules. There are different ways you
could lay it out, but for the sake of convenience, we’ll show you
a sample layout so that you can fill in the blanks:

---
```haskell
module Reverse where
    string :: String
    string = "Curry is awesome"
    rvrs :: String -> String
    rvrs x = part3 ++ part2 ++ " " ++ part1
        where part1 = take 5 string
              part2 = take 3 $ drop 5 string
              part3 = drop 9 string
    main :: IO ()
    main = print (rvrs string)
```