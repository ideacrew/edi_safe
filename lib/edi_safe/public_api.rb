# frozen_string_literal: true

module EdiSafe
  # Publicly exposed methods for users of the gem.
  module PublicApi
    # Detect any "unsafe" characters and perform substitution.
    def transform(string, xml = true)
      return string if string.nil? || string.empty?
      transformer = ::EdiSafe::Transformer.new
      transformer.transform(string, xml)
    end
  end
end
