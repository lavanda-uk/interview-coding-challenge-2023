defmodule WordCount do
  @moduledoc """
  A module that emulates the behavior of the Unix `wc` command.

  This module provides functions to count lines, words, and characters in a file,
  matching the exact behavior of the Unix `wc` command.
  """

  defstruct [:file_path, :content]

  @doc """
  Creates a new WordCount struct by reading the specified file.

  ## Parameters
  - file_path: String path to the file to analyze

  ## Returns
  - {:ok, %WordCount{}} on success
  - {:error, reason} on failure (e.g., file not found)

  ## Examples
      iex> {:ok, wc} = WordCount.new("../../data/file.txt")
      iex> wc.file_path
      "../../data/file.txt"
  """
  def new(file_path) do
    case File.read(file_path) do
      {:ok, content} ->
        {:ok, %WordCount{file_path: file_path, content: content}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Counts the number of lines in the file.

  Lines are counted by counting newline characters, matching wc behavior.

  ## Parameters
  - wc: %WordCount{} struct

  ## Returns
  - Integer count of lines
  """
  def line_count(%WordCount{content: content}) do
    content
    |> String.graphemes()
    |> Enum.count(&(&1 == "\n"))
  end

  @doc """
  Counts the number of words in the file.

  Words are counted by splitting on whitespace, matching wc behavior.

  ## Parameters
  - wc: %WordCount{} struct

  ## Returns
  - Integer count of words
  """
  def word_count(%WordCount{content: content}) do
    content
    |> String.split()
    |> length()
  end

  @doc """
  Counts the number of characters in the file.

  ## Parameters
  - wc: %WordCount{} struct

  ## Returns
  - Integer count of characters
  """
  def character_count(%WordCount{content: content}) do
    String.length(content)
  end

  @doc """
  Returns all counts as a map.

  ## Parameters
  - wc: %WordCount{} struct

  ## Returns
  - Map with keys :lines, :words, :characters, :file_path
  """
  def count(wc) do
    %{
      lines: line_count(wc),
      words: word_count(wc),
      characters: character_count(wc),
      file_path: wc.file_path
    }
  end

  @doc """
  Formats the output to match the wc command format.

  ## Parameters
  - wc: %WordCount{} struct

  ## Returns
  - String formatted like wc command output
  """
  def format_output(wc) do
    lines = line_count(wc)
    words = word_count(wc)
    chars = character_count(wc)

    :io_lib.format("~8w ~7w ~7w ~s", [lines, words, chars, wc.file_path])
    |> IO.iodata_to_binary()
  end
end
