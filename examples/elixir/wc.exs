#!/usr/bin/env elixir

# Simple Elixir script to run word count from command line
# Usage: elixir wc.exs <filename>

Code.require_file("lib/word_count.ex")
Code.require_file("lib/word_count/cli.ex")

WordCount.CLI.main(System.argv())
