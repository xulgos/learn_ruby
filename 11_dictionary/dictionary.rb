class Dictionary

  def entries
    @entries ||= {}
  end

  def add word_def_pairs
    unless word_def_pairs.respond_to? :keys
      return entries[word_def_pairs] = nil
    end
    entries.merge! word_def_pairs
  end

  def keywords
    entries.keys.sort
  end

  def include? entry
    entries.has_key? entry
  end

  def find entry
    entries.select { |word, definition| word =~ /#{entry}/ }
  end

  def printable
    entries.map { |word, definition| "[#{word}] \"#{definition}\"" }.sort.join "\n"
  end
end
