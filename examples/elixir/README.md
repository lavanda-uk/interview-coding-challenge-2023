# Elixir wc Implementation

This directory contains an Elixir implementation that emulates the behavior of the Unix `wc` (word count) command.

## Files

- **`lib/word_count.ex`** - The main `WordCount` module that implements the word counting functionality
- **`lib/word_count/cli.ex`** - Command-line interface module
- **`wc.exs`** - Simple Elixir script for direct execution
- **`test/word_count_test.exs`** - ExUnit test suite
- **`test/test_helper.exs`** - ExUnit configuration
- **`mix.exs`** - Mix project configuration

## Requirements

- Elixir 1.18+ with OTP 26+

## Usage

### Command Line Script
```bash
# Run using elixir command
elixir wc.exs ../../data/file.txt

# Or use as executable
./wc.exs ../../data/file.txt
```

### Mix Escript (Compiled Executable)
```bash
# Build the escript
mix escript.build

# Run the compiled executable
./word_count ../../data/file.txt
```

### Elixir API
```elixir
# Start an iex session
iex -S mix

# Use the WordCount module
{:ok, wc} = WordCount.new("../../data/file.txt")
WordCount.line_count(wc)      # Number of lines
WordCount.word_count(wc)      # Number of words  
WordCount.character_count(wc) # Number of characters
WordCount.format_output(wc)   # Formatted output like wc command
```

## Running Tests

```bash
# Run all tests
mix test

# Run tests with verbose output
mix test --trace

# Run specific test file
mix test test/word_count_test.exs
```

## Features

- **Exact wc compatibility**: Produces identical output to the Unix `wc` command
- **Comprehensive testing**: 12 test cases (including doctests) covering normal usage and edge cases
- **Error handling**: Proper handling of non-existent files with Elixir's `{:ok, result}` / `{:error, reason}` pattern
- **Functional design**: Immutable data structures and pure functions
- **Edge case handling**: Works correctly with empty files, files without trailing newlines, etc.
- **Multiple execution methods**: Script, escript, and API usage

## Implementation Notes

- The line counting algorithm matches `wc`'s behavior by counting newline characters using `String.graphemes/1`
- Uses Elixir's pattern matching and error handling idioms
- Follows Elixir naming conventions and documentation standards
- Leverages Elixir's functional programming paradigms

## Output Format

```
      13     511    3090 ../../data/file.txt
      ^      ^      ^    ^
   lines  words  chars  filename
```

This matches the exact formatting of the Unix `wc` command.

## Project Structure

```
examples/elixir/
├── lib/
│   ├── word_count.ex          # Main module
│   └── word_count/
│       └── cli.ex             # CLI module
├── test/
│   ├── word_count_test.exs    # Test suite
│   └── test_helper.exs        # Test configuration
├── mix.exs                    # Project configuration
├── wc.exs                     # Simple script
└── README.md                  # This file
``` 