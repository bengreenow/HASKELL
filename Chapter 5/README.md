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
3. take :: Int -> [a] -> [a]
myTake x = take x "hey you"
4. (>) :: Ord a => a -> a -> Bool
myCom x = x > (length [1..10])
```