# Chapter 5 Exercises

## Exercise 1: Type Matching

### 1

Below you’ll find a list of several standard functions we’ve talked
about previously. Under that is a list of their type signatures. Match
the function to its type signature. Try to do it without peeking at the
type signatures (either in the text or in GHCi) and then check your
work. You may find it easier to start from the types and work out
what you think a function of that type would do.

---

a) `not`\
`_ :: Bool -> Bool`

---
b) `length`\
`_ :: [a] -> Int`

---
c) `concat`\
`_ :: [[a]] -> [a]`

---
d) `head`\
`_ :: [a] -> a`

---
e) `(<)`\
`_ :: Ord a => a -> a -> Bool`

---

## Exercise 2 Type Arguments


Given a function and its type, tell us what type results from
applying some or all of the arguments.
You can check your work in the REPL like this (using the
first question as an example):

```haskell
Prelude> let f :: a -> a -> a -> a; f = undefined
Prelude> let x :: Char; x = undefined
Prelude> :t f x
```

It turns out that you can check the types of things that aren’t
implemented yet, so long as you give GHCi an undefined to
bind the signature to.

### 1

If the type of `f` is `a -> a -> a -> a`, and the type of `x` is `Char`
then the type of `f x` is



```haskell
a) Char -> Char -> Char -- this one, as when f x is run, the 'a' becomes the determined type of 'Char'
b) x -> x -> x -> x
c) a -> a -> a
d) a -> a -> a -> Char
```


### 2

If the type of `g` is `a -> b -> c -> b`, then the type of `g 0 'c' "woot"` is

```haskell
a) String
b) Char -> String
c) Int
d) Char -- It's a char as (b -> (c -> b)) evaluates to Char
```



### 3

If the type of `h` is `(Num a, Num b) => a -> b -> b`, then the type of `h 1.0 2` is:

```haskell
a) Double
b) Integer
c) Integral b => b
d) Num b => b -- a -> b -> b evaluates to b, and type constraint on b is Num b
```



### 4

If the type of `h` is `(Num a, Num b) => a -> b -> b`, then the type of
`h 1 (5.5 :: Double)` is

```haskell
a) Integer
b) Fractional b => b
c) Double  -- b becomes a double type.
d) Num b => b
```



### 5

If the type of `jackal` is `(Ord a, Eq b) => a -> b -> a`, then the type
of
`jackal "keyboard" "has the word jackal in it"`

```haskell
a) [Char] -- As a -> b -> a reduces to a, and a is a String
b) Eq b => b
c) b -> [Char]
d) b
e) Eq b => b -> [Char]
```

### 6

If the type of `jackal` is `(Ord a, Eq b) => a -> b -> a`, then the type
of
`jackal "keyboard"`

```haskell
a) b
b) Eq b => b
c) [Char]
d) b -> [Char]
e) Eq b => b -> [Char] -- this, as a is been defined as a [Char] instance.
```

### 7

If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the
type of `kessel 1 2` is

```haskell
a) Integer -- as haskell assumes numbers are Integers or Doubles if the type is ambiguous
b) Int
c) a
d) (Num a, Ord a) => a
e) Ord a => a
f ) Num a => a
```

### 8

If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the
type of
`kessel 1 (2 :: Integer)` is

```haskell
a) (Num a, Ord a) => a
b) Int
c) a
d) Num a => a
e) Ord a => a
f) Integer -- as haskell assumes numbers are Integers or Doubles if the type is ambiguous
```

### 9

If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the
type of `kessel (1 :: Integer) 2` is

```haskell
a) Num a => a
b) Ord a => a
c) Integer -- as haskell assumes numbers are Integers or Doubles if the type is ambiguous
d) (Num a, Ord a) => a
e) a
```

## Exercise 3 Parametricity

All you can do with a parametrically polymorphic value is pass or
not pass it to some other expression. Prove that to yourself with
these small demonstrations.

### 1

Given the type `a -> a`, which is the type for `id`, attempt to make
a function that terminates successfully that does something
other than returning the same value. This is impossible, but
you should try it anyway.
```haskell
Prelude> let f x = x*267^2
Prelude> f 5
356445
Prelude> id f 5
356445  -- Darn, it's the same
```

### 2

We can get a more comfortable appreciation of parametricity
by looking at `a -> a -> a`. This hypothetical function `a -> a ->
a` has two–and only two–implementations. Write both possible
versions of `a -> a -> a`. After doing so, try to violate the
constraints of parametrically polymorphic values we outlined
above.


```haskell
f :: a -> a -> a
f a b = a
```

```haskell
g :: a -> a -> a
g a b = b
```

### 3

Implement `a -> b -> b`. How many implementations can it
have? Does the behavior change when the types of `a` and `b`
change?

```haskell
h :: a -> b -> b
h a b = b
```
No matter what type `a` is, it will normalize to the type of `b`, hence one implementation, and why the behaviour does not change.

## Exercise 2

Look at these pairs of functions. One function is unapplied,
so the compiler will infer maximally polymorphic type. The
second function has been applied to a value, so the inferred type signature may have become concrete, or at least less
polymorphic. Figure out how the type would change and why,
make a note of what you think the new inferred type would
be and then check your work in GHCi.

```haskell
1. -- Type signature of general function
(++) :: [a] -> [a] -> [a]
-- How might that change when we apply
-- it to the following value?
myConcat x = x ++ " yo"
```

`myConcat :: [Char] -> [Char] -> [Char]`
As the `a` is defined as a `String`

```haskell
2. -- General function
(*) :: Num a => a -> a -> a
-- Applied to a value
myMult x = (x / 3) * 5
```

`myMult :: Int -> Int`
As even though the `x` is unknown, as the `5` is int, so is the `x/3`.

```haskell
3. take :: Int -> [a] -> [a]
myTake x = take x "hey you"
```

`myTake :: Int -> [Char]`
`[a]` is defined as a string.

```haskell
4. (>) :: Ord a => a -> a -> Bool
myCom x = x > (length [1..10])
```

`myCom :: Ord a -> Bool`

```haskell
5. (<) :: Ord a => a -> a -> Bool
myAlph x = x < 'z'
```

`myAlph :: Char -> Bool`
`'z'` defines a as a `Char`.

## Chapter Exercises

Welcome to another round of “Knowing is not enough; we must
apply.

### Multiple choice

1. A value of type `[a]` is\
a) a list of alphabetic characters\
b) a list of lists\
c) a list whose elements are all of some type 𝑎\
d) a list whose elements are all of different types

---

C

---

2. A function of type `[[a]] -> [a]` could\
a) take a list of strings as an argument\
b) transform a character into a string\
c) transform a string into a list of strings\
d) take two arguments

---

A

---

3. A function of type `[a] -> Int -> a`\
a) takes one argument\
b) returns one element of type 𝑎 from a list\
c) must return an Int value\
d) is completely fictional

---

B

---

4. A function of type `(a, b) -> a`\
a) takes a list argument and returns a Char value\
b) has zero arguments\
c) takes a tuple argument and returns the first value\
d) requires that 𝑎 and 𝑏 be of different types

---

C - It doesnt _have_ too return the first value, but it returns a value of the same type. This answer is the most correct.

---

### Determine the type

For the following functions, determine the type of the specified value.
We suggest you type them into a file and load the contents of the file
in GHCi. In all likelihood, it initially will not have the polymorphic
types you might expect due to the monomorphism restriction. That
means that top-level declarations by default will have a concrete type
if any can be determined. You can fix this by setting up your file like
so:

```haskell
{-# LANGUAGE NoMonomorphismRestriction #-}
module DetermineTheType where
-- simple example
example = 1
```

If you had not included the `NoMonomorphismRestriction` extension,
`example` would have had the type `Integer` instead of `Num a => a`. Do
your best to determine the most polymorphic type an expression
could have in the following exercises.

---

1. All function applications return a value. Determine the value
returned by these function applications and the type of that
value.

```haskell
a) (* 9) 6 -- 54, (* 9) 6 :: Num a => a
b) head [(0,"doge"),(1,"kitteh")] -- (0,"doge"),  (0,"doge") :: Num a => (a, [Char])
c) head [(0 :: Integer ,"doge"),(1,"kitteh")] -- (0, "doge"),  (0, "doge") :: (Integer,[Char])
d) if False then True else False -- False, False :: Bool
e) length [1, 2, 3, 4, 5] -- 5, Integer
f ) (length [1, 2, 3, 4]) > (length "TACOCAT") -- False, False :: Bool
```

---

2. Given
```haskell
x = 5
y = x + 5
w = y * 10
```
What is the type of `w`?

`Num a => a`

---

3. Given

```hakell
x = 5
y = x + 5
z y = y * 10
```

What is the type of `z`?

`Num a => a -> a`

---

4. Given

```haskell
x = 5
y = x + 5
f = 4 / y
```

What is the type of `f`?

`Fractional a => a`

---

5. Given

```haskell
x = "Julie"
y = " <3 "
z = "Haskell"
f = x ++ y ++ z
```

What is the type of `f`?

`[Char]`

### Does it compile?

For each set of expressions, figure out which expression, if any, causes
the compiler to squawk at you (n.b. we do not mean literal squawking)
and why. Fix it if you can

```haskell
1. bigNum = (^) 5 $ 10
   wahoo = bigNum $ 10 -- No, as here bigNum is simply a number, and the, yet it's treated like a function here.

   -- wahoo = bigNum
```

```haskell
2. x = print
   y = print "woohoo!"
   z = x "hello world"
   -- This would compile
```

```haskell
3. a = (+)
   b = 5
   c = b 10 -- The compiler expects b to be some sort of function as you cannot simply store data like this. Would not compile
   d = c 200

   -- c = a b 10
   -- d = a c 200
```

```haskell
4. a = 12 + b
   b = 10000 * c -- c not in scope (or defined.)


   -- c = 20
```

### Type variable or specific type constructor?

1. You will be shown a type declaration, and you should categorize
each type. The choices are a fully polymorphic type variable,
constrained polymorphic type variable, or concrete type constructor.

```haskell
f :: Num a => a -> b -> Int -> Int
--           [0]  [1]   [2]    [3]
```
Here, the answer would be: constrained polymorphic (Num) ([0]),
fully polymorphic ([1]), and concrete ([2] and [3]).

---

2. Categorize each component of the type signature as described
in the previous example.

```haskell
f :: zed -> Zed -> Blah
```

Fully polymorphic (zed), concrete (Zed), concrete (Blah)

---

3. Categorize each component of the type signature
```haskell
f :: Enum b => a -> b -> C
```

Fully polymorphic, Constrained polymorphic (Enum), concrete.

---

4. Categorize each component of the type signature


```haskell
f :: f -> g -> C
```

Fully polymorphic, fully polymorpic, concrete.


### Write a type signature

For the following expressions, please add a type signature. You should be able to rely on GHCi type inference to check your work, although you might not have precisely the same answer as GHCi gives (due to polymorphism, etc).

---

1. While we haven’t fully explained this syntax yet, you’ve seen it in Chapter 2 and as a solution to an exercise in Chapter 4. This syntax is a way of destructuring a single element of a list by pattern matching.

```haskell
functionH :: [a] -> a
functionH (x:_) = x
```

---


```haskell
2. functionC :: Num a => a -> Bool
   functionC x y =
      if (x > y) then True else False
```

---


```haskell
3. functionS :: (a, b) -> b
   functionS (x, y) = y
```

### Given a type, write the function


You will be shown a type and a function that needs to be writ- ten. Use the information the type provides to determine what the function should do. We’ll also tell you how many ways there are to write the function. Syntactically different but semantically equivalent implementations are not counted as being different. For example, writing a function one way then rewriting the semantically identical function but using anony- mous lambda syntax does not count as two implementations.
To make things a little easier, we’ll demonstrate how to solve this kind of exercise. Given:

```haskell
myFunc :: (x -> y) -> (y -> z)
   -> c
   -> (a, x) -> (a, z)
myFunc xToY yToZ _ (a, x) = undefined
```

Talking through the above, we have a function that takes four arguments. The final result is a tuple with the type (a, z). It turns out, the 𝑐 argument is nowhere in our results and there’s nothing to do with it, so we use the underscore to ignore that. We named the two function arguments by their types and pattern matched on the tuple argument. The only way to get the second value of the tuple from the type 𝑥 to the type 𝑧 is to use both of the functions furnished to us. If we tried the following:

```haskell
myFunc xToY yToZ _ (a, x) =
   (a, (xToY x))
```

We would get a type error that it expected the type 𝑧 but the actual type was 𝑦. That’s because we’re on the right path, but not quite done yet! Accordingly, the following should typecheck:

```haskell
myFunc :: (x -> y) -> (y -> z)
-> c
-> (a, x) -> (a, z)
myFunc xToY yToZ _ (a, x) = (a, (yToZ (xToY x)))
```

---


1. There is only one function definition that typechecks and doesn’t go into an infinite loop when you run it.

```haskell
i :: a -> a
i x = x
```

2. There is only one version that works.

```haskell
c :: a -> b -> a
c x y = x
```

3. Given alpha equivalence are `c''` and `c` (see above) the same thing?

Yes.

```haskell
c'' :: b -> a -> b
c'' x y = x
```

4. Only one version that works.

```haskell
c' :: a -> b -> b 
c' x y = y
```

5. There are multiple possibilities, at least two of which
you’ve seen in previous chapters.

```haskell
r :: [a] -> [a]
r x = reverse x
```

6. Only one version that will typecheck.

```haskell
co :: (b -> c) -> (a -> b) -> a -> c
co x y z = y
```

7. One version will typecheck.

```haskell
a :: (a -> c) -> a -> a
a x y = x
```

8. One version will typecheck.
```haskell
a' :: (a -> b) -> a -> b 
a' x y = y
```

### Fix it

Won’t someone take pity on this poor broken code and fix it up? Be sure to check carefully for things like capitalization, parentheses, and indentation.

1.
```haskell
   module sing where
     fstString :: [Char] ++ [Char]
     fstString x = x ++ " in the rain"

     sndString :: [Char] -> Char
     sndString x = x ++ " over the rainbow"

     sing = if (x > y) then fstString x or sndString y
     where x = "Singin"
           x = "Somewhere"
```

```haskell
   module sing where
     fstString :: [Char] -> [Char]
     fstString x = x ++ " in the rain"

     sndString :: [Char] -> [Char]
     sndString x = x ++ " over the rainbow"

     sing = if (x > y) then 
         fstString x or sndString y
            where x = "Singin"
                  y = "Somewhere"
```

2. Now that it’s fixed, make a minor change and make it sing the other song. If you’re lucky, you’ll end up with both songs stuck in your head!

```haskell
   module sing where
     fstString :: [Char] -> [Char]
     fstString x = x ++ " in the rain"

     sndString :: [Char] -> [Char]
     sndString x = x ++ " over the rainbow"

     sing = if (x < y) then 
         fstString x or sndString y
            where x = "Singin"
                  y = "Somewhere"
```

3.
```haskell
module Arith3Broken where
main :: IO ()
Main = do
   print 1 + 2
   putStrLn 10
   print (negate -1) print ((+) 0 blah)
   where blah = negate 1
```

```haskell
module Arith3Broken where
   main :: IO ()
   main = do
      print 1 + 2
      putStrLn 10
      print (negate -1)
      print ((+) 0 blah)
      where blah = negate 1
```
