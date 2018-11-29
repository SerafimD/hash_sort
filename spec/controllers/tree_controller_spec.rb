RSpec.describe TreeController do
  let(:body) { {"color":"green","location":"unknown","type":"martian","weight":"light"}.to_json }

  before(:each) do
    Behavior.new(:id => 11, :properties => {"color": "green", "location": "unknown", "type": "martian"})
  end

  it 'must valid' do
    post '/build_tree_v1', body, {'CONTENT_TYPE' => 'application/json'}
  end
end
