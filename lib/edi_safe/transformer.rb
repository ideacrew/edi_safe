# frozen_string_literal: true

module EdiSafe
  # Performs the actual work of detection and transformation.
  class Transformer
    def initialize
      @special_character_regex = ::EdiSafe::Inventory::MATCHING_REGEX
      @special_character_substitution = ::EdiSafe::Inventory::SUBSTITUTION_HASH
    end

    def transform(string, xml = true)
      return string unless @special_character_regex =~ string
      string.gsub(@special_character_regex) do |char|
        sub_char = @special_character_substitution[char]
        xml ? CGI.escapeHTML(sub_char) : sub_char
      end
    end
  end
end
