# Loops

Loops are the second fundamental control structure in Ruby. **Loops** instruct
the interpreter to execute a section of code while a condition holds. Loops are
tremendously powerful: they allow one to execute a potentially infinite number
of operations with a few lines of code.


## While Loops

The simplest loop is the _while loop_. If you run the following snippet in
Repl.it, you'll have to refresh the page. Can you guess why?

```ruby
while 2 < 3
  2 + 3
end
```

Like if statements, while loops begin with a keyword (`while`) followed by a
conditional expression. Also like if statements, while loops end with `end`. If
the conditional expression evaluates to a truthy value, then the interpreter
executes the subordinate block. The interpreter then rechecks the condition and
executes the block again if it's still truthy. A while loop instructs the Ruby
interpreter to execute its subordinate block as long as its conditional
expression is truthy.

The above code is an example of an **infinite loop**, a sequence of instructions
that loops endlessly. An infinite loop is almost always a mistake.

How might you introduce a terminating condition to a while loop? This condition
must be truthy at first but would eventually become falsey, so as to terminate
the loop. The most common approach is to assign a counter variable outside of
the loop and increment it within the loop:

```ruby
counter = 0

while counter < 10
  puts "This is iteration number #{counter.to_s}!"
  counter = counter + 1 # counter += 1 is the syntactic-sugar equivalent
end
```

The interpreter evaluates the expression following `while` for truthiness at the
start of each loop. After the counter is incremented to `11`, the condition
becomes falsey, so the loop terminates.

The `until` keyword is the opposite of `while`. It directs the interpreter to
loop until a _true_ condition is met:

```ruby
counter = 0

until counter == 10
  puts "This is iteration number #{counter.to_s}!"
  counter = counter + 1 # counter += 1 is the syntactic-sugar equivalent
end
```

Although a while loop is technically an expression in that it evaluates to a
single value, that value is always `nil`. If the while loop is within the body
of a method definition, one can explicitly return a value from the loop (and the
method) using the `return` keyword:

```ruby
#this method returns the first number in an array that's greater than 10
def first_num_greater_than_ten(arr)
  index = 0
  while index < arr.length #thereby iterating through the array
    # is_a? checks whether an object belongs to a data type. String, Symbol,
    # Array, NilClass, TrueClass, and FalseClass are valid arguments of is_a?
    if arr[index].is_a?(Numeric) && arr[index] > 10
      return arr[index]
    end
    index += 1
  end
  #if no number meeting the criteria is found, the method implicitly returns nil
end
```

One can terminate the loop without returning from a method using the `break`
keyword. `break` occasionally takes an optional argument that assigns the loop's
value upon its termination.

```ruby
def to_uninfinity_and_beyond
  while true
    "I'd be an infinite loop without break"
    break
  end
  "reachable code"
end

counter = 0

while true
  puts "This is iteration number #{counter.to_s}!"
  counter += 1
  break counter if counter > 10 #the loop's value is the last value of counter
end
```

The `next` keyword skips a loop ahead to its next iteration:

```ruby
counter = 0
while counter < 10
  counter += 1
  next if counter.odd?
  puts "I only print even numbers from 1 to 10, including #{counter.to_s}"
end
```


## For Loops

The _for loop_ is another common Ruby loop.

```ruby
for i in 0..10
  puts "This is iteration number #{i.to_s}!"
end
```

Unlike in conditional statements, the Ruby interpreter does not evaluate the
expression following the keyword `for` for truthiness. Instead it assigns the
variable `i` to the first element in the range (`0`) and executes the
subordinate block. Upon the next iteration, the interpreter increments the value
of the variable to the next element in the range. The final iteration occurs
after the variable has been assigned to the final element in the range (when `i`
is `10`).

Upon completion, the value of the for loop is its range. You can also use arrays
instead of ranges in for loops, in which case the value of the loop would be the
array. The keywords `return`, `break`, and `next` function in for loops exactly
as they do in while loops.

You can nest loops just as you can nest conditional statements:

```ruby
for i in [1,2,3,4,5]
  count = 0
  for j in 1..100
    next if i % j != 0
    count += 1
  end
  puts "There are #{count.to_s} numbers divisible by #{i.to_s} from 1 to 100."
end
```

You can use either arrays or ranges in for loops because both have access to a
set of methods known as enumerables, which will be the subject of the next
chapter.