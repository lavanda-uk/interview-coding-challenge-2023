# Ruby wc Implementation

This directory contains a Ruby implementation that emulates the behavior of the Unix `wc` (word count) command.

## Files

- **`lib/word_count.rb`** - The main `WordCount` class that implements the word counting functionality
- **`wc.rb`** - Command-line executable script
- **`spec/word_count_spec.rb`** - RSpec test suite
- **`spec/spec_helper.rb`** - RSpec configuration

## Usage

### Command Line
```bash
# Run the word count on a file
ruby wc.rb ../../data/file.txt

# Or use as executable
./wc.rb ../../data/file.txt
```

### Ruby API
```ruby
require_relative 'lib/word_count'

wc = WordCount.new('../../data/file.txt')
puts wc.line_count      # Number of lines
puts wc.word_count      # Number of words  
puts wc.character_count # Number of characters
puts wc.to_s           # Formatted output like wc command
```

## Running Tests

```bash
# From the examples/ruby directory
bundle exec rspec

# Run specific test file
bundle exec rspec spec/word_count_spec.rb
```

## Features

- **Exact wc compatibility**: Produces identical output to the Unix `wc` command
- **Comprehensive testing**: 11 test cases covering normal usage and edge cases
- **Error handling**: Proper handling of non-existent files
- **Clean architecture**: Well-structured, readable code with proper separation of concerns
- **Edge case handling**: Works correctly with empty files, files without trailing newlines, etc.

## Implementation Notes

The line counting algorithm matches `wc`'s behavior by counting newline characters rather than using Ruby's `lines.count` method. This ensures proper handling of files that don't end with a newline character.

## Output Format

```
      13     511    3090 ../../data/file.txt
      ^      ^      ^    ^
   lines  words  chars  filename
```

This matches the exact formatting of the Unix `wc` command. 