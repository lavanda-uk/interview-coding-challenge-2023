require_relative '../lib/word_count'

RSpec.describe WordCount do
  describe '#initialize' do
    it 'accepts a file path' do
      wc = WordCount.new('../../data/file.txt')
      expect(wc.file_path).to eq('../../data/file.txt')
    end
  end

  describe '#line_count' do
    it 'returns the correct number of lines' do
      wc = WordCount.new('../../data/file.txt')
      expect(wc.line_count).to eq(13)
    end
  end

  describe '#word_count' do
    it 'returns the correct number of words' do
      wc = WordCount.new('../../data/file.txt')
      expect(wc.word_count).to eq(511)
    end
  end

  describe '#character_count' do
    it 'returns the correct number of characters' do
      wc = WordCount.new('../../data/file.txt')
      expect(wc.character_count).to eq(3090)
    end
  end

  describe '#to_s' do
    it 'returns output in wc format' do
      wc = WordCount.new('../../data/file.txt')
      expect(wc.to_s).to eq('      13     511    3090 ../../data/file.txt')
    end
  end

  describe '#count' do
    it 'returns a hash with all counts' do
      wc = WordCount.new('../../data/file.txt')
      result = wc.count
      expect(result).to eq({
        lines: 13,
        words: 511,
        characters: 3090,
        file_path: '../../data/file.txt'
      })
    end
  end

  context 'with non-existent file' do
    it 'raises an error' do
      expect { WordCount.new('non_existent_file.txt') }.to raise_error(Errno::ENOENT)
    end
  end

  context 'edge cases' do
    let(:temp_file) { 'spec/temp_test_file.txt' }
    
    after do
      File.delete(temp_file) if File.exist?(temp_file)
    end

    it 'handles empty files' do
      File.write(temp_file, '')
      wc = WordCount.new(temp_file)
      
      expect(wc.line_count).to eq(0)
      expect(wc.word_count).to eq(0)
      expect(wc.character_count).to eq(0)
    end

    it 'handles single word files' do
      File.write(temp_file, 'hello')
      wc = WordCount.new(temp_file)
      
      expect(wc.line_count).to eq(0)  # no newlines
      expect(wc.word_count).to eq(1)
      expect(wc.character_count).to eq(5)
    end

    it 'handles files with only newlines' do
      File.write(temp_file, "\n\n\n")
      wc = WordCount.new(temp_file)
      
      expect(wc.line_count).to eq(3)
      expect(wc.word_count).to eq(0)
      expect(wc.character_count).to eq(3)
    end

    it 'handles files with multiple spaces between words' do
      File.write(temp_file, "hello    world\n")
      wc = WordCount.new(temp_file)
      
      expect(wc.line_count).to eq(1)
      expect(wc.word_count).to eq(2)  # split handles multiple spaces
      expect(wc.character_count).to eq(15)
    end
  end
end 