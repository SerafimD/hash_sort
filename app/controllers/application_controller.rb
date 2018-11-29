require_relative 'concerns/json_render'

class ApplicationController < Sinatra::Base
  include JsonRender
  use ParseErrorsMiddleware
  configure do
    enable :cross_origin
  end

  configure :development do
    enable :logging
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
    content_type :json
  end

  options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  helpers do
    def json_params
      begin
        request.body.rewind # in case someone already read it =)
        JSON.parse(request.body.read)
      rescue => e
        halt 400, { message: e }.to_json
      end
    end

    def behavior
      @behavior ||= Behavior.find_by_id(params[:id]) || halt(404)
    end

  end

end
