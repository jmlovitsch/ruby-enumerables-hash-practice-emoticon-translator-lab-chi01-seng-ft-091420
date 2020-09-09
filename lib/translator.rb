require 'yaml'
require 'pry'


def load_library(file_path)
  library = YAML.load_file(file_path)
  library.each do |key, value|
    # binding.pry
    value.unshift(:english)
    value.insert(-2 ,:japanese)
    library[key] = Hash[*value]
  end
  library
end

def get_english_meaning (file_path = './lib/emoticons.yml', japanese_emoticon)
  sorry_message = "Sorry, that emoticon was not found"
  library = load_library(file_path)
  library.each do |emotion, emoticon_hash|
    emoticon_hash.each do |language, emoji|
      if emoji == japanese_emoticon
        emotion
      else
        sorry_message
      end
    end
  end
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  library = load_library(file_path)
  library.each do |emotion, emoticon_hash|
    emoticon_hash.each do |language, emoji|
      if emoji == english_emoticon
        return emotion[:japanese][emoji]
      end
    end
  end
end
        
        
        
        
        