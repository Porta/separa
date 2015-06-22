Separa
====

Separa splits chunks of text into tokens to be indexed

Description
-----------

Separa splits chunks of text or ruby objects into tokens to be indexed by [Busca](https://github.com/Porta/busca), the simple redis search.

## Installation

As usual, you can install it using rubygems.

```
$ gem install separa
```

## Usage

The simplest possible usage is with default options:

```ruby
separa = Separa.new
words = "This is a bunch of words. Separated"
result = separa.call(words)
puts result.inspect
# ["This", "is", "a", "bunch", "of", "words", "", "Separated"]
```

You'll notice a few things here:
* There's an empty element between `words` and `Separated`
* Words kept their capitalization

That's all intended. Separa only takes care of spliting the string into an array. It is up to you to filter later that array.

Separa comes bundled with two 'Separators', but you can roll your own (more on that later).
The separator usage is fairly simple, just pass the separator to the `Separa.new` constructor.

[Separa::Text](./lib/Separa/text.rb) Splits a string of text into an array. You can pass a regexp to be used on the split.

[Separa::Obj](./lib/Separa/obj.rb) Splits a ruby hash into an array. This is where things get interesting.
Let's see a example:

```ruby
separa = Separa.new(Separa::Obj)
h = { uno: 1, dos: 2, tres: {uno: 'one', dos: 'two'} }
result = separa.call(h)
puts result.inspect
# ["uno:1", "dos:2", "tres.uno:one", "tres.dos:two"]
```

By default, Separa::Obj will use a semicollon divide the object key and it's value. You can change that passing a different divider.

```ruby
separa = Separa.new(Separa::Obj, divider: '-')
h = { uno: 1, dos: 2, tres: {uno: 'one', dos: 'two'} }
result = separa.call(h)
puts result.inspect
# ["uno-1", "dos-2", "tres.uno-one", "tres.dos-two"]
```


## Roll your own separator

Writting your own separator is fairly simple. You only need to take care of 3 things.

* It should respond to a `call` method.
* The `call` method should receive 2 parameters. The string to split and a hash with options.
* It should return an array. (Actually, returning an array isn't required, but recommended. I mean, that's *half* of the objective of this library, right?)

Take a look at the bundled separators if you need inspiration:

[Separa::Text](./lib/Separa/text.rb)
[Separa::Obj](./lib/Separa/obj.rb)

The code is pretty straightforward.

Have fun splitting your strings, and drop a line to julian@porta.sh if you have something to say.

