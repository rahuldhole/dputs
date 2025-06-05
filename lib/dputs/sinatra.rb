require 'sinatra/base'

module Dputs
  module Sinatra
    def self.registered(app)
      # include Dputs into app’s helpers so dp, dpp, etc. are available in routes/console
      app.helpers Dputs
    end
  end
end
