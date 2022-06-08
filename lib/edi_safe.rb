# frozen_string_literal: true

require_relative "edi_safe/version"
require_relative "edi_safe/inventory"
require_relative "edi_safe/transformer"
require_relative "edi_safe/public_api"

# Detects and corrects characters EDI can't handle in payloads.
module EdiSafe
  class << self
    include PublicApi
  end
end
