# frozen_string_literal: true

require_relative "inventory/accented_set"
require_relative "inventory/punctuated_set"

module EdiSafe
  # A set of dictionaries of characters which EDI can or can't handle.
  module Inventory
    # rubocop:disable Metrics/AbcSize
    def self.create_character_regex
      ranges = ranges_from_inventory_arrays
      mapped_to_ranges = ranges.map do |range|
        if range.first == range.last
          Regexp.escape(range.first)
        else
          Regexp.escape(range.first) + "-" + Regexp.escape(range.last)
        end
      end
      Regexp.compile("[" + mapped_to_ranges.join("") + "]")
    end
    # rubocop:enable Metrics/AbcSize

    # rubocop:disable Metrics/MethodLength
    def self.ranges_from_inventory_arrays
      full_set = AccentedSet::CHARACTER_SET + PunctuatedSet::CHARACTER_SET
      sorted_set = full_set.compact.uniq.sort
      ranges = []
      left = sorted_set.first
      right = nil
      sorted_set.each do |obj|
        if right && obj != right.succ
          ranges << Range.new(left, right)
          left = obj
        end
        right = obj
      end
      ranges << Range.new(left, right)
      ranges
    end
    # rubocop:enable Metrics/MethodLength

    MATCHING_REGEX = create_character_regex

    SUBSTITUTION_HASH = AccentedSet::REPLACEMENTS.merge(PunctuatedSet::REPLACEMENTS).freeze
  end
end
