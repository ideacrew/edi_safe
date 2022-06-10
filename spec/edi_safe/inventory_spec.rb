# frozen_string_literal: true

RSpec.describe EdiSafe do
  it "has a matching inventory regex" do
    expect(EdiSafe::Inventory::MATCHING_REGEX.class).to eq Regexp
  end

  it "has a replacement hash" do
    expect(EdiSafe::Inventory::SUBSTITUTION_HASH.class).to eq Hash
  end
end
