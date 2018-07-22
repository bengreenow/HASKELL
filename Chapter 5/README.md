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

---

```haskell
a) Char -> Char -> Char -- this one, as when f x is run, the 'a' becomes the determined type of 'Char'
b) x -> x -> x -> x
c) a -> a -> a
d) a -> a -> a -> Char
```

---

### 2

If the type of `g` is `a -> b -> c -> b`, then the type of `g 0 'c' "woot"` is

```haskell
a) String
b) Char -> String
c) Int
d) Char -- It's a char as (b -> (c -> b)) evaluates to Char
```

---

### 3

If the type of `h` is `(Num a, Num b) => a -> b -> b`, then the type of `h 1.0 2` is:

```haskell
a) Double
b) Integer
c) Integral b => b
d) Num b => b -- a -> b -> b evaluates to b, and type constraint on b is Num b
```

---

### 4


