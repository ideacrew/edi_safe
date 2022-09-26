# frozen_string_literal: true

RSpec.describe EdiSafe do
  let(:string_with_special_characters) do
    (
      EdiSafe::Inventory::AccentedSet::CHARACTER_SET +
      EdiSafe::Inventory::PunctuatedSet::CHARACTER_SET
    ).join
  end

  # rubocop:disable Metrics/LineLength
  let(:expected_substitution_result) do
    "AAAAAAAECEEEEIIIIDNOOOOOxOUUUUYThssaaaaaaaeceeeeiiiidnoooooouuuuythyAaAaAaCcCcCcCcDdDdEeEeEeEeEeGgGgGgGgHhHhIiIiIiIiIiIJijJjKkkLlLlLlLlLlNnNnNn&#39;nNGngOoOoOoOEoeRrRrRrSsSsSsSsTtTtTtUuUuUuUuUuUuWwYyYZzZzZz&quot;&quot;&#39;&#39;&#39;&#39;&lt;&lt;&gt;&gt;"
  end
  # rubocop:enable Metrics/LineLength

  let(:normal_string) do
    "ABCDEFGHIJKLMNOPabcdefghijklmnop0123456789"
  end

  it "has a version number" do
    expect(EdiSafe::VERSION).not_to be nil
  end

  it "performs replacements on strings with special characters" do
    expect(EdiSafe.transform(string_with_special_characters)).to eq expected_substitution_result
  end

  it "does nothing to a normal string" do
    expect(EdiSafe.transform(normal_string)).to eq normal_string
  end

  it "does nothing to nil" do
    expect(EdiSafe.transform(nil)).to eq nil
  end
end
