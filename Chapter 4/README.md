# Chapter 4 Exercises

## Exercise 1: Mood Swing

Given the following datatype, answer the following questions:
```haskell
data Mood = Blah | Woot deriving Show
```
The `deriving Show` part is not something we’ve explained yet. For
now, all we’ll say is that when you make your own datatypes, deriving
Show allows the values of that type to be printed to the screen. We’ll
talk about it more when we talk about typeclasses in detail.

### 1

What is the type constructor, or name of this type?

---

"`Mood`" is the type constructor.

### 2

If the function requires a `Mood` value, what are the values you
could possibly use?

---
`Blah` or `Woot`

### 3

We are trying to write a function `changeMood` to change Chris’s
mood instantaneously. It should act like `not` in that, given one
value, it returns the _other_ value of the same type. So far, we’ve
written a type signature `changeMood :: Mood -> Woot`. What’s wrong
with that?

---
In the type signiture, the _type_ of data being passed too and returned from a function is defined. In `changeMood :: Mood -> Woot`, while we are passing a `Mood` object _too_ the function, we haven't defined a `Woot` object. To correct this use `changeMood :: Mood -> Mood`
### 4

Now we want to write the function that changes his mood. Given
an input mood, it gives us the other one. Fix any mistakes and
complete the function:
```haskell
changeMood Mood = Woot
changeMood _ = Blah
```
We’re doing something here called _pattern matching_. We can
define a function by matching on a data constructor, or value,
and describing the behavior that the function should have based
on which value it matches. The underscore in the second line
denotes a catch-all, otherwise case. So, in the first line of the
function, we’re telling it what to do in the case of a specific input.
In the second one, we’re telling it what to do regardless of _all
potential inputs_. It’s trivial when there are only two potential
values of a given type, but as we deal with more complex cases,
it can be convenient.

---
```haskell
changeMood Blah = Woot
changeMood _ = Blah
```

### 5

Enter all of the above — datatype (including the deriving Show
bit), your corrected type signature, and the corrected function
into a source file. Load it and run it in GHCi to make sure you
got it right.

---
```haskell
data Mood = Blah | Woot deriving Show
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah
```

---

![alt text](changeMoodCmd.png "Command Line")


# Exercise 2: Find the Mistakes

The following lines of code may have mistakes — some of
them won’t compile! You know what you need to do.
1. `not True && true` - The second True is not capitalized. `not True && True`
2. `not (x = 6)` - A single = is the incorrect operator. `not (x==6)`
3. `(1 * 2) > 5` - This will compile.
4. `[Merry] > [Happy]` - This will not compile as `Merry` and `Happy` are not defined. `["Merry"] > ["Happy"]`
5. `[1, 2, 3] ++ "look at me!"` - This will not compile as the lists contain different data types. the type signature of `(++)` is `(++) :: [a] -> [a] -> [a]`

# Chapter Exercises:

## Exercise 1:

```haskell
awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]
```

`length` is a function that takes a list and returns a result that tells
how many items are in the list.


### 1

Given the definition of length above, what would the type signature
be? How many arguments, of what type does it take? What
is the type of the result it evaluates to?

---

Given that `length` takes a list as an input, and (since lists cannot have a fractional length) returns an integer, the type signature would be `length :: [a] -> Integer`

### 2

a) `length [1, 2, 3, 4, 5]`

---

`5`

---
b) `length [(1, 2), (2, 3), (3, 4)]`

---

`3`

---
c) `length allAwesome`

---

`2`

---

d) `length (concat allAwesome)`

---

`5`


### 3

Given what we know about numeric types and the type signature
of length, look at these two expressions. One works and one
returns an error. Determine which will return an error and why.
(n.b., you will find `Foldable t => t a` representing `[a]`, as with
concat in the previous chapter. Again, consider `Foldable t` to
represent a list here, even though list is only one of the possible
types.)
```haskell
Prelude> 6 / 3
-- and
Prelude> 6 / length [1, 2, 3]
```

---

As the `(/)` operator requires two arguements whos type is in the class "`Fractional`", passing it an `Int` in the form of `length [1,2,3]` will stop runtime.

### 4

How can you fix the broken code from the preceding exercise
using a different division function/operator?

---

By using `div`.

### 5

What is the type of the expression 2 + 3 == 5? What would we
expect as a result?

---

Boolean, `True`.

### 6

What is the type and expected result value of the following:
```haskell
Prelude> let x = 5
Prelude> x + 3 == 5
```

---

Boolean, `False`.

### 7

Below are some bits of code. Which will work? Why or why
not? If they will work, what value would these reduce to?
```haskell
Prelude> length allAwesome == 2
-- This will work, and will output a boolean True.
Prelude> length [1, 'a', 3, 'b']
-- This will not work, as the list contains more than one type.
Prelude> length allAwesome + length awesome -- This will work, adding two integers together.
Prelude> (8 == 8) && ('b' < 'a')
-- This will work, and is equivelant to True AND False, so this will reduce to False.
Prelude> (8 == 8) && 9
-- This is equivelent to True AND False also. So reduce to False
```

### 8

Write a function that tells you whether or not a given String (or
list) is a palindrome. Here you’ll want to use a function called
reverse a predefined function that does what it sounds like.
```haskell
reverse :: [a] -> [a]
reverse "blah"
"halb"
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = undefined
```

---
```haskell
isPalindrome :: String -> Bool
isPalindrome x = (reverse x == x)
```
### 9

Write a function to return the absolute value of a number using
if-then-else
```haskell
myAbs :: Integer -> Integer
myAbs = undefined
```

---

```haskell
myAbs :: Integer -> Integer
myAbs x = if (x < 0) then (negate x)
          else x
```

### 10

Fill in the definition of the following function, using `fst` and
`snd`:
```haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f = undefined
```

---

```haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y),(fst x, fst y))
```

## Exercise 2: Correcting Syntax

In the following examples, you’ll be shown syntactically incorrect
code. Type it in and try to correct it in your text editor, validating it
with GHC or GHCi.

### 1

Here, we want a function that adds 1 to the length of a string
argument and returns that result.

```haskell
x = (+)
F xs = w 'x' 1
    where w = length xs
```

---

`x` is defined, then the char `'x'` is used.
```haskell
x = (+)
F xs = w x 1
    where w = length xs
```

### 2

This is supposed to be the identity function, `id`.
```haskell
\X = x
```

---

`\` is just wrong.
```haskell
X = x
```

### 3

When fixed, this function will return `1` from the value `(1, 2)`.
```haskell
f (a b) = A
```

---

Capitalization matters yo.
```haskell
f (a b) = a
```

## Exercise 3: Match the function names to their types

### 1

Which of the following types is the type of `show`?
```haskell
a) show a => a -> String
b) Show a -> a -> String
c) Show a => a -> String
```

---

a, as c is capitalized and `show` doesn't have two parameters.


### 2

Which of the following types is the type of `(==)`?

```haskell
a) a -> a -> Bool
b) Eq a => a -> a -> Bool
c) Eq a -> a -> a -> Bool
d) Eq a => A -> Bool
```

---

A, takes two inputs of the same type and returns a boolean value of if they are equal.

### 3

Which of the following types is the type of `fst`?

```haskell
a) (a, b) -> a
b) b -> a
c) (a, b) -> b
```

---

A, takes the type of the first item in the pair and returns it.

### 4

Which of the following types is the type of `(+)`?

```haskell
a) (+) :: Num a -> a -> a -> Bool
b) (+) :: Num a => a -> a -> Bool
c) (+) :: num a => a -> a -> a
d) (+) :: Num a => a -> a -> a
e) (+) :: a -> a -> a
```

---

D, as the input must be a `Num` (note the capitalization) and it outputs the sum of the two, which will also be a `Num`

