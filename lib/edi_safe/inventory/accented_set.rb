# frozen_string_literal: true

require "i18n/backend/transliterator"

module EdiSafe
  module Inventory
    # Handles accented characters that have simpler, if less precise, equivalents.
    class AccentedSet
      REPLACEMENTS = I18n::Backend::Transliterator::HashTransliterator::DEFAULT_APPROXIMATIONS

      CHARACTER_SET = REPLACEMENTS.keys.freeze
    end
  end
end
