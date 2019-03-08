require "rspec"

#Given a string, find the length of the longest substring without repeating characters.

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  longest = ''
  hash = Hash.new
  word = ''
  s.each_char.with_index do |char, index|
    if hash[char].nil?
      hash[char] = index 
      word += char
      longest = word if word.length > longest.length
    else
      start = hash[char]
      hash.reject! { |k, v| v < start }
      word = s[(start + 1)..index]
      hash[char] = index
    end 
  end 
  return longest.length
end


# rspec

describe "length_of_longest_substring" do
  it "returns the length of the longest substring" do
    expect(length_of_longest_substring("abcabcbb")).to eq(3)
  end
  
  it "returns the length of the longest substring" do
    expect(length_of_longest_substring("bbbbb")).to eq(1)
  end

  it "returns the length of the longest substring" do
    expect(length_of_longest_substring("pwwkew")).to eq(3)
  end
 end
