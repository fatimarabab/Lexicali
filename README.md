# Lexicali

## The Problem

We provided a simple website that wraps a lexicon of words and a few methods to
interact with that lexicon.  The code reads the lexicon into memory during
the website's startup.

The goal of the project is to update the site and lexicon so that it can do the
following:

* Generate all possible anagrams of a word - DONE
    * Solution: Preprocess Lexicon and store into 2 hash maps
    * Hashmap 1 i.e. words_to_sorted maps words to a string with the word's letters sorted alphabetically
    * Hashmap 2 i.e. anagrams maps sorted strings to it's corresponding anagrams
    * Time Complexity: O(1) time using both hashes return anagrams, Space complexity: O(n) + O(n) = 2*O(n) in worst case.

* Find all words with a given prefix - DONE
    * Solution: Since `word.txt` is sorted we can iterate through the dictionary array to find words
    * Break loop once all words with given prefix are found by using .start_with? method
    * Time Complexity: O(x), x = index of last word with given prefix in dictionary
    * Space Complexity: O(m), m = number of words with given prefix.
    * Optional Solution implemented in `trie.rb` file using Tries and Depth First Search

* Print the shortest possible word ladder between two words -DONE
    * Solution: Using Breadth First Search find shortest path b/w start_word and end_word.
    * Time complexity: O(L * N) where L = start_word.length/end_word.length, N is the total number of words in the dictionary. 
    * Space complexity: O(N) where N is the total number of words in the dictionary for storing all words in set.

* Return the results using ajax requests instead of page navigation

See the [Requirements](#requirements) section below for more details.

## Project Setup

The site is a small [Sinatra](http://www.sinatrarb.com/) application that you'll
need Ruby to run.  Most systems come preinstalled with Ruby on them.  You will
want version 2.3 or later.

A few packages are necessary to run the site.  To get them run the following:

* `gem install bundler`
* `bundle install`

This will install the necessary dependencies to run the site.  At this point you
can launch the site by running:

`bundle exec ruby site.rb`

The site should tell you that it started successfully and let you know that it
is running on `localhost:4567`.  Go ahead and navigate your browser to that
location to see it.

Please initialize git in the root directory and commit regularly. We will be
using the git history to better understand your thought process!

## Project Structure

Now that you have the site running let's take a peek under the hood.

* `Gemfile` and `Gemfile.lock` declare the project dependencies that you've
already installed.
* `word.txt` is the full set of words in the lexicon.  You won't need to change
this but feel free to look at it to get a sense of the words you'll be using.
* `public/` houses the javascript and css.  Note that jQuery is already
included for you.
* `views/` contains two Haml templates for the two main pages.
* `lexicon.rb` is the base class that reads the words into memory.
* `special_lexicon.rb` has some stubs for you to implement the anagrams, prefix,
and word ladder lookups.
* `site.rb` defines all of the routes and logic for our simple server.

The main stubs are provided inside `special_lexicon.rb`. You can place
all your code to solve the algorithmic problems inside that file, but you are
welcome to modify `lexicon.rb` if you want to change any functionality in that
class.

In the process of updating the site to be a cool single page app as your final
piece of this task you will also want to take a peek inside of `main.js` and
`index.haml`.  You can add or alter any markup in `index.haml` to make your life
easier.  `main.js` is where you'll want to add or alter the code in order to
perform any requests needed to avoid page navigation.  Of course, should the
mood strike, feel free to update any styles on the page as well.

Finally, please  write a few quick comments for each lexicon method describing
how you decided to solve the problem.  In addition, make sure to leave comments
in the JS where it makes sense.  It's perfectly acceptable and encouraged to use
the internet for help (after all, that's what you'll be doing on the job!), just make
sure you cite any sources.

Please make sure that you are commit regularly with thoughtful commit messages throughout the project.

## Resources

You may find the following sites helpful for a basic overview of the libraries
being used on the site.  Deep knowledge isn't required.  A quick overview
augmented by some Google-fu should be more than enough.

* [Sinatra](http://www.sinatrarb.com/) - A micro web framework.
* [Haml](http://haml.info/tutorial.html) - Nice, clean HTML markup.
* [Bundler](http://bundler.io/) - Application dependency management.

## Requirements

* Simple, clean, easy to read, and easy to understand code (that goes for comments and commit messages as well!)
* Efficient algorithmic implementations
* It runs and produces the correct results
* It does not throw exceptions or crash when given unexpected inputs

You shouldn't need to know Ruby, Haml, or Sinatra particularly well to complete
the task.  We aren't looking for deep, idiomatic knowledge of any of those.

### Anagrams

* You can find the anagram for marsipobranchiata
* You do it in better than O(n) time, for n = size of the dictionary

### Prefixed words

* Find prefixes faster than O(n) time, for n = size of the dictionary

### Word ladder

* Non-lexicon start and end words should print something sensible
* The word shortest possible ladder from chair -> table is found efficiently
  * One example ladder: chair -> charr -> chirr -> shirr -> shire -> spire -> spiry -> sairy -> saily -> sably -> sable -> table

## Deliverables

Please send back a URL that points to your zip of the entire app, including:

* The entire `.git/` directory so that we can look through your commit history.
* All files needed to run the app. This should include any and all files you added or changed.

Please _do not_ upload your app to a public repo. Alternatively, you can sign up for a free trial of DocSend to send your deliverable to us!

## Some Helpful Info

### Tradeoffs

* You should treat everything case insensitively
* Prioritize the speed of web requests over startup time
* Feel free to trade memory for speed / algorithmic efficiency

### Definitions

#### Anagram
**Definition:** A rearranging of the letters of a word to form a new dictionary word,
using each letter from the original word exactly once. For example, 'act' is an
anagram for 'cat' but 'tca' is not.

#### Word Ladder
**Definition:** The shortest possible chain between two words where each step in
the chain differs by only a single letter. The start and end words must be the
same length.

**Example:** cold -> cord -> card -> ward -> warm

**See:** http://en.wikipedia.org/wiki/Word_ladder
