# frozen_string_literal: true
require_relative "dputs/version"
require 'pp'
require 'ap'

module Dputs
  class Error < StandardError; end

  def self.get_varname(var, method)
    loc = caller_locations(2, 1)[0]
    path, line = loc.path, loc.lineno

    if path == '(irb)' || path == '(eval)'
      if defined?(IRB) && IRB.conf[:MAIN_CONTEXT]
        b = IRB.conf[:MAIN_CONTEXT].workspace.binding
        b.local_variables.each do |name|
          return name.to_s if b.local_variable_get(name).equal?(var)
        end
      end
      return "unknown"
    else
      begin
        code_line = File.readlines(path)[line - 1]
        if code_line =~ /\b#{method}\s*\(?\s*([a-zA-Z_][a-zA-Z0-9_]*)/
          return Regexp.last_match(1)
        end
      rescue
        # ignore
      end
      "unknown"
    end
  end

  def dputs(var)
    name = Dputs.get_varname(var, "dputs")
    puts "#{name}: #{var.inspect}"
  end

  def dp(var)
    name = Dputs.get_varname(var, "dp")
    puts "#{name}: #{var.inspect}"
  end

  def dprint(var)
    name = Dputs.get_varname(var, "dprint")
    print "#{name}: #{var.inspect}"
  end

  def dpp(var)
    name = Dputs.get_varname(var, "dpp")
    print "#{name}: "
    pp var
  end

  def dap(var)
    name = Dputs.get_varname(var, "dpp")
    print "#{name}: "
    ap var
  end
end

# Inject into Kernel, so dp, dpp, etc. are always available
module Kernel
  include Dputs
end

if defined?(Rails)
  require_relative "dputs/railtie"
end

if defined?(Sinatra)
  require_relative "dputs/sinatra"
  ::Sinatra::Base.register Dputs::Sinatra
end
