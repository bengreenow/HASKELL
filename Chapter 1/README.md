# Chapter 1

## Exercise 1 Intermission:

### 1
We’ll give you a lambda expression. Keeping in mind both alpha equivalence and how multiple heads are nested, choose an answer that is equivalent to the listed lambda term.


𝜆xy.xz\

a)  𝜆𝑥𝑧.𝑥𝑧\
b)  𝜆𝑚𝑛.𝑚𝑧\
c)  𝜆𝑧.(𝜆𝑥.𝑥𝑧)

---

B, symbols are simply placeholders and are interchangeable

### 2

𝜆𝑥𝑦.𝑥𝑥𝑦

a)  𝜆𝑚𝑛.𝑚𝑛𝑝\
b)  𝜆𝑥.(𝜆𝑦.𝑥𝑦)\
c)  𝜆𝑎.(𝜆𝑏.𝑎𝑎𝑏)

---

C, attempting substitution of a = x, b = y, results in same expression

### 3

𝜆𝑥𝑦𝑧.𝑧𝑥

a)  𝜆𝑥.(𝜆𝑦.(𝜆𝑧.𝑧))\
b)  𝜆𝑡𝑜𝑠.𝑠𝑡\
c)  𝜆𝑚𝑛𝑝.𝑚𝑛

---

B, symbols are simply placeholders and are interchangeable

## Exercise 2: Combinators

### 1

Combinators Determine if each of the following are combinators or not.

1. 𝜆𝑥.𝑥𝑥𝑥       - Combinator
2. 𝜆𝑥𝑦.𝑧𝑥𝑦      - Not a Combinator
3. 𝜆𝑥𝑦𝑧.𝑥𝑦(𝑧𝑥)  - Combinator
4. 𝜆𝑥𝑦𝑧.𝑥𝑦(𝑧𝑥𝑦) - Combinator
5. 𝜆𝑥𝑦.𝑥𝑦(𝑧𝑥𝑦)  - Not a Combinator

### 2

Normal form or diverge? Determine if each of the following can be reduced to a normal form or if they diverge.

1. 𝜆𝑥.𝑥𝑥𝑥           - NF
2. (𝜆𝑧.𝑧𝑧)(𝜆𝑦.𝑦𝑦)   - Diverge
3. (𝜆𝑥.𝑥𝑥𝑥)𝑧        - NF

### 3

Beta reduce Evaluate (that is, beta reduce) each of the following expressions to normal form. We strongly recommend writing out the steps on paper with a pencil or pen.

1. (𝜆𝑎𝑏𝑐.𝑐𝑏𝑎)𝑧𝑧(𝜆𝑤𝑣.𝑤)      - z
2. (𝜆𝑥.𝜆𝑦.𝑥𝑦𝑦)(𝜆𝑎.𝑎)𝑏       - bb
3. (𝜆𝑦.𝑦)(𝜆𝑥.𝑥𝑥)(𝜆𝑧.𝑧𝑞)     - qq
4. (𝜆𝑧.𝑧)(𝜆𝑧.𝑧𝑧)(𝜆𝑧.𝑧𝑦)     - y
5. (𝜆𝑥.𝜆𝑦.𝑥𝑦𝑦)(𝜆𝑦.𝑦)y       - yy
6. (𝜆𝑎.𝑎𝑎)(𝜆𝑏.𝑏𝑎)c          - caa
7. (𝜆𝑥𝑦𝑧.𝑥𝑧(𝑦𝑧))(𝜆𝑥.𝑧)(𝜆𝑥.𝑎) - 𝜆z.za