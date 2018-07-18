# 2.5 Evaluation

## Exercises: Comprehension Check

### 1

Given the following lines of code as they might appear in a source file, how would you change them to use them directly in the REPL?

```haskell
half x = x /2
square x = x * x
```

**Answer:**

```haskell
let half x = x /2
let square x = x * x
```

***

### 2

Write one function that can accept one argument and work for all the following expressions. Be sure to name the function.

```haskell
3.14 * (5 * 5)
3.14 * (10 * 10)
3.14 * (2 * 2)
3.14 * (4 * 4)
```

**Answer:**

```haskell
radius x = 3.14 * (x * x)
```

***

# 3

There is a value in Prelude called pi. Rewrite your function to use pi instead of 3.14.

**Answer:**

```haskell
radius x = pi * (x * x)
```

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

# 2.7 Declaring values

## Exercises: Heal the Sick

### 1

```haskell
let area x = 3. 14 * (x * x)
```

Answer: Space between 3. and 14.

```haskell
let area x = 3.14 * (x * x)
```

***

### 2

```haskell
let double x = b * 2
```

Answer: Variable 'x' not used in function declaration, instead 'b' is used.

```haskell
let double x = x * 2
```

***

### 3

```haskell
x = 7
 y = 10
f = x + y
```

**Answer:** All declorations must be on the same column.

```haskell
x = 7
y = 10
f = x + y
```
