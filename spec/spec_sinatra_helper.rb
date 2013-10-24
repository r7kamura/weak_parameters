ENV['RACK_ENV'] = 'test'

require File.expand_path '../../spec/dummy/sinatra_app', __FILE__
require 'rack/test'

def app
  App
end
