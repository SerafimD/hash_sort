class ApplicationController < Sinatra::Base
  use CatchJsonParseErrors
  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  # services include
  Dir.glob("./app/services/*.rb", &method(:require))

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end

end