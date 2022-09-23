# frozen_string_literal: true

module EdiSafe
  module Inventory
    # Handles simple punction that could be encoded as a far simpler string.
    class PunctuatedSet
      REPLACEMENTS = {
        "“" => "\"",
        "”" => "\"",
        "‘" => "'",
        "’" => "'",
        "«" => "<<",
        "»" => ">>",
        "¿" => "",
        "|" => "",
        "~" => "",
        "^" => "",
        "{" => "",
        "}" => "",
        "¡" => ""
      }.freeze

      CHARACTER_SET = REPLACEMENTS.keys.freeze
    end
  end
end
