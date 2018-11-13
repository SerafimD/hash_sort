class ApplicationController < Sinatra::Base
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
        JSON.parse(request.body.read)
      rescue
        halt 400, { message:'Invalid JSON' }.to_json
      end
    end

    def render_result(json)
      return json.errors.messages.to_json unless json.valid?
      if json.class < ActiveRecord::Base || json.class < ActiveRecord::Relation
        {json: json, root: :result}.to_json
      else
        {json: {result: json}}.to_json
      end
    end

  end

end