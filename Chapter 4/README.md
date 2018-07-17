
Chapter 4 Exercises

Exercise 1: Mood Swing

Given the following datatype, answer the following questions:

data Mood = Blah | Woot deriving Show



The deriving Show part is not something we’ve explained yet. For now, all we’ll say is that when you make your own datatypes, deriving Show allows the values of that type to be printed to the screen. We’ll talk about it more when we talk about typeclasses in detail.

1

What is the type constructor, or name of this type?

$

" Mood " is the type constructor.

2

If the function requires a Mood value, what are the values you could possibly use?

$

 Blah or Woot 

3

We are trying to write a function changeMood to change Chris’s mood instantaneously. It should act like not in that, given one value, it returns the other value of the same type. So far, we’ve written a type signature changeMood :: Mood -> Woot . What’s wrong with that?

$

In the type signiture, the type of data being passed too and returned from a function is defined. In changeMood :: Mood -> Woot , while we are passing a Mood object too the function, we haven't defined a Woot object. To correct this use changeMood :: Mood -> Mood 

4

Now we want to write the function that changes his mood. Given an input mood, it gives us the other one. Fix any mistakes and complete the function:

changeMood Mood = Woot
changeMood _ = Blah



We’re doing something here called pattern matching . We can define a function by matching on a data constructor, or value, and describing the behavior that the function should have based on which value it matches. The underscore in the second line denotes a catch-all, otherwise case. So, in the first line of the function, we’re telling it what to do in the case of a specific input. In the second one, we’re telling it what to do regardless of all potential inputs . It’s trivial when there are only two potential values of a given type, but as we deal with more complex cases, it can be convenient.

$

changeMood Blah = Woot
changeMood _ = Blah



5

Enter all of the above — datatype (including the deriving Show bit), your corrected type signature, and the corrected function into a source file. Load it and run it in GHCi to make sure you got it right.

$


changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah


<<<<<<< HEAD


$

￼

Exercise 2: Find the Mistakes

The following lines of code may have mistakes — some of them won’t compile! You know what you need to do.
1.  not True && true - the second True is not capitalized. not True && True 
2.  not (x = 6) - a single = is the incorrect operator. not (x==6) 
3.  (1 * 2) > 5 - this will compile.
4.  [Merry] > [Happy] 

• this won't compile as Merry and Happy aren't defined. ["Merry"] > ["Happy"] 

1.  [1, 2, 3] ++ "look at me!" - this code won't compile as the concatenation operator doesn't work with integers. ['1','2','3'] ++ "look at me!" 

Chapter Exercises

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]



 length is a function that takes a list and returns a result that tells how many items are in the list.

Exercise 1:

1

Given the definition of length above, what would the type signature be? How many arguments, of what type does it take? What is the type of the result it evaluates to?

$

Since length takes a list as an input, and (since lists cannot have a fractional length) returns an integer, the type signature would be length :: [a] -> Integer 

2

What are the results of the following expressions?

a) length [1, 2, 3, 4, 5]




5




b) length [(1, 2), (2, 3), (3, 4)]




3




c) length allAwesome




2




d) length (concat allAwesome)




5



=======
![alt text](changeMoodCmd.png "Command Line")
>>>>>>> parent of 2507079... Work
