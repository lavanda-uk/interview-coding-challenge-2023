defmodule WordCount.CLI do
  @moduledoc """
  Command-line interface for the WordCount module.

  This module provides the main/1 function that serves as the entry point
  for the escript executable.
  """

  @doc """
  Main entry point for the command-line interface.

  ## Parameters
  - args: List of command-line arguments

  ## Examples
      WordCount.CLI.main(["../../data/file.txt"])
  """
  def main(args) do
    case args do
      [] ->
        IO.puts("Usage: word_count <filename>")
        System.halt(1)

      [filename | _] ->
        case WordCount.new(filename) do
          {:ok, wc} ->
            wc
            |> WordCount.format_output()
            |> IO.puts()

          {:error, :enoent} ->
            IO.puts("wc: #{filename}: No such file or directory")
            System.halt(1)

          {:error, reason} ->
            IO.puts("Error: #{reason}")
            System.halt(1)
        end
    end
  end
end
