require 'json'
require 'sinatra'
require_relative '../../app/controllers/application_controller'
require_relative '../../app/controllers/main_controller'

RSpec.describe MainController do

  let(:body) { [{"x1": "aaa", "x2": "bbb", "x3": "ccc"}, {"y1": "bbb", "y2": "ccc", "y3": "ddd"}, {"z1": "ccc", "z2": "ddd", "z3": "eee"}].to_json }
  before do
    post '/build_hash_tree', body, {'CONTENT_TYPE' => 'application/json'}
  end
  subject { last_response }
  it { should be_ok }

end

