require 'rails'

module Dputs
  class Railtie < Rails::Railtie
    initializer "dputs.auto_include" do
      # include Dputs into Kernel as early as possible
      Kernel.include Dputs
    end
  end
end
