# frozen_string_literal: true
require_relative '../lib/dputs'
require 'tempfile'

RSpec.describe Dputs do
  it "has a version number" do
    expect(Dputs::VERSION).not_to be nil
  end

  it "outputs variable name and value" do
    my_var = 123
    expect { dp(my_var) }.to output(/my_var: 123/).to_stdout
  end

  it "prints the variable name when run from a file" do
    lib_path = File.expand_path("../lib/dputs", __dir__)
    
    # 2. Create a temp file that requires our code and calls dp
    file = Tempfile.new(["test_script", ".rb"])
    file.write <<~RUBY
      require "#{lib_path}"
      my_var = 456
      dp my_var
    RUBY
    file.close

    # 3. Execute `ruby <that file>` and capture stdout
    output = `ruby #{file.path}`.chomp

    # 4. Expect the output to include "my_var: 456"
    expect(output).to match(/my_var: 456/)

    file.unlink
  end
end
