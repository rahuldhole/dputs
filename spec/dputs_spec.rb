# frozen_string_literal: true
require_relative '../lib/dputs'

RSpec.describe Dputs do
  it "has a version number" do
    expect(Dputs::VERSION).not_to be nil
  end

  it "outputs variable name and value" do
    my_var = 123
    expect { dp(my_var) }.to output(/my_var: 123/).to_stdout
  end
end
