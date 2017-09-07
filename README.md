## Ruby Markov Chain Exercise

This is a basic text generator using a Markov chain algorithm. It is very simple and not intended to be used in any kind of environment, only as an experiment and learning tool for myself.

### Requirements
Built and tested with Ruby v2.3.0.

For testing: `rspec`

### Usage
To run the text generator using the default values, from the project home directory:
```bash
$: ruby lib/markov.rb
```
This will use the text set in `lib/markov.rb` set to the variable `BODY`, and generate a string of max length 140 using the first word of the string as the starting word. This will be a first order chain generation, meaning the generated strings will be built from the probabilities of a word being used after a _single_ word.

To change the functionality of the string generator, the following parameters can be set in the `generate_text()` function as key/values in an object:

```ruby
{
  body: <String>,
  initial: <String>,
  order: <Integer>,
  max_length: <Integer>,
}
```
Body:
This is the text that the chain is generated from, it must be a string. This defaults to the text set to the variable `BODY`.

Initial:
This is the word that will be used as the starting point for any string generated, if it is chosen poorly the generated string will be small. The default is the first word of the body.

Order:
This is the number of words used to generate the values for each key of the Markov chain. This defaults to 1.

Max Length:
This is the maximum number of characters that the generated text will reach. This defaults to 140 characters.

### Testing
To run the tests, from the project home directory:
```bash
$: rspec test/markov_spec.rb
```

### Tips for use
The greater your source text the more options of initial values you will have available and the more variance there will be in your generated text. 1st order chains allow for more variance in generated text but will give less readability. The higher the order used the more readable but the less variance the generated text will have.

### License
MIT
