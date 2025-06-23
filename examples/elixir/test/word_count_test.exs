defmodule WordCountTest do
  use ExUnit.Case
  doctest WordCount

  describe "WordCount.new/1" do
    test "creates a WordCount struct with valid file" do
      {:ok, wc} = WordCount.new("../../data/file.txt")
      assert wc.file_path == "../../data/file.txt"
      assert is_binary(wc.content)
    end

    test "returns error for non-existent file" do
      assert {:error, :enoent} = WordCount.new("non_existent_file.txt")
    end
  end

  describe "WordCount.line_count/1" do
    test "returns correct number of lines" do
      {:ok, wc} = WordCount.new("../../data/file.txt")
      assert WordCount.line_count(wc) == 13
    end
  end

  describe "WordCount.word_count/1" do
    test "returns correct number of words" do
      {:ok, wc} = WordCount.new("../../data/file.txt")
      assert WordCount.word_count(wc) == 511
    end
  end

  describe "WordCount.character_count/1" do
    test "returns correct number of characters" do
      {:ok, wc} = WordCount.new("../../data/file.txt")
      assert WordCount.character_count(wc) == 3090
    end
  end

  describe "WordCount.count/1" do
    test "returns map with all counts" do
      {:ok, wc} = WordCount.new("../../data/file.txt")
      result = WordCount.count(wc)

      assert result == %{
        lines: 13,
        words: 511,
        characters: 3090,
        file_path: "../../data/file.txt"
      }
    end
  end

  describe "WordCount.format_output/1" do
    test "returns output in wc format" do
      {:ok, wc} = WordCount.new("../../data/file.txt")
      output = WordCount.format_output(wc)
      assert output == "      13     511    3090 ../../data/file.txt"
    end
  end

  describe "edge cases" do
    setup do
      temp_file = "test/temp_test_file.txt"

      on_exit(fn ->
        if File.exists?(temp_file) do
          File.rm!(temp_file)
        end
      end)

      {:ok, temp_file: temp_file}
    end

    test "handles empty files", %{temp_file: temp_file} do
      File.write!(temp_file, "")
      {:ok, wc} = WordCount.new(temp_file)

      assert WordCount.line_count(wc) == 0
      assert WordCount.word_count(wc) == 0
      assert WordCount.character_count(wc) == 0
    end

    test "handles single word files", %{temp_file: temp_file} do
      File.write!(temp_file, "hello")
      {:ok, wc} = WordCount.new(temp_file)

      assert WordCount.line_count(wc) == 0  # no newlines
      assert WordCount.word_count(wc) == 1
      assert WordCount.character_count(wc) == 5
    end

    test "handles files with only newlines", %{temp_file: temp_file} do
      File.write!(temp_file, "\n\n\n")
      {:ok, wc} = WordCount.new(temp_file)

      assert WordCount.line_count(wc) == 3
      assert WordCount.word_count(wc) == 0
      assert WordCount.character_count(wc) == 3
    end

    test "handles files with multiple spaces between words", %{temp_file: temp_file} do
      File.write!(temp_file, "hello    world\n")
      {:ok, wc} = WordCount.new(temp_file)

      assert WordCount.line_count(wc) == 1
      assert WordCount.word_count(wc) == 2  # String.split handles multiple spaces
      assert WordCount.character_count(wc) == 15
    end
  end
end
