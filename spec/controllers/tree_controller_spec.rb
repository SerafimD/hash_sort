require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require_relative '../../app/models/behaviors'
require_relative '../../app/middleware/parse_errors_middleware'
require_relative '../../app/controllers/application_controller'
require_relative '../../app/controllers/tree_controller'
require_relative '../../app/services/sort_tree_service'
RSpec.describe TreeController do
  let(:body) { {"color":"green","location":"unknown","type":"martian","weight":"light"}.to_json }

  before(:each) do
    Behavior.new(:id => 11, :properties => {"color": "green", "location": "unknown", "type": "martian"})
  end

  it 'must valid' do
    post '/build_tree_v1', body, {'CONTENT_TYPE' => 'application/json'}
  end
end
