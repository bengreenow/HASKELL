# 2.6 Infix operators

## Exercises: Parentheses and Association

Below are some pairs of functions that are alike except for parenthesization. Read them carefully and decide if the parentheses change the results of the function. Check your work in GHCi.

### 1

```haskell
-- a
8 + 7 * 9

-- b
(8 + 7) * 9
```

**Answer:** The brackets will change the output.

***

### 2

```haskell
-- a
perimeter x y = (x * 2) + (y * 2)

-- b
perimeter x y = x * 2 + y * 2
```

Answer:
The brackets won't change the output.

***

### 3

```haskell
-- a
f x = x / 2 + 9

-- b
f x = x / (2 + 9)
```

**Answer:** The brackets will change the output.
