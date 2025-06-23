# WordCount class that emulates the behavior of the Unix wc command
class WordCount
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
    @content = read_file
  end

  # Count the number of lines in the file
  # wc counts lines by counting newline characters
  def line_count
    @line_count ||= @content.scan(/\n/).length
  end

  # Count the number of words in the file
  def word_count
    @word_count ||= @content.split.count
  end

  # Count the number of characters in the file
  def character_count
    @character_count ||= @content.length
  end

  # Return a hash with all counts
  def count
    {
      lines: line_count,
      words: word_count,
      characters: character_count,
      file_path: file_path
    }
  end

  # Return formatted output matching wc command format
  def to_s
    sprintf("%8d %7d %7d %s", line_count, word_count, character_count, file_path)
  end

  private

  def read_file
    File.read(file_path)
  rescue Errno::ENOENT
    raise Errno::ENOENT, "No such file or directory - #{file_path}"
  end
end 