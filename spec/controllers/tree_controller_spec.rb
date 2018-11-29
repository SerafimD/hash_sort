RSpec.describe TreeController do
  let(:body) { {"color":"green","location":"unknown","type":"martian","weight":"light"}.to_json }

  context 'base controller test' do

    it 'must answer' do
      Behavior.create(:id => 11, :properties => {"color": "green", "location": "unknown", "type": "martian"})
      post '/build_tree_v1', body, headers: {'CONTENT_TYPE' => 'application/json'}
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq('{"json":{"result":{"key":"color","values":{"green":{"key":"location","values":{"unknown":{"key":"type","values":{"martian":[11]}}}}}}}}')
    end

    it 'should work as in the example' do
      Behavior.create(:id => 11, :properties => {"color": "green", "location": "unknown", "type": "martian"})
      Behavior.create(:id => 12, :properties => {"color": "red", "real": "no"})
      Behavior.create(:id => 13, :properties => {"location": "Moscow"})
      post '/build_tree_v1', body, headers: {'CONTENT_TYPE' => 'application/json'}
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq('{"json":{"result":{"key":"color","values":{"green":{"key":"location","values":{"unknown":{"key":"type","values":{"martian":[11]}}}},"red":{"key":"real","values":{"no":[12]}}},"default":{"key":"location","values":{"Moscow":[13]}}}}}')
    end

    it 'I think it should work like this' do
      Behavior.create(:id => 11, :properties => {"color": "green", "location": "unknown", "type": "martian"})
      Behavior.create(:id => 12, :properties => {"color": "red", "real": "no"})
      Behavior.create(:id => 13, :properties => {"location": "Moscow"})
      post '/build_tree_v2', body, headers: {'CONTENT_TYPE' => 'application/json'}
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq('{"json":{"result":{"key":"color","values":{"green":{"key":"location","values":{"unknown":{"key":"type","values":{"martian":[11]}}}}},"default":{"key":"location","values":{"red":{"key":"real","values":{"no":[12]}},"Moscow":[13]}}}}}')
    end

    it 'Must generate PDF report file' do
      Behavior.create(:id => 11, :properties => {"color": "green", "location": "unknown", "type": "martian"})
      Behavior.create(:id => 12, :properties => {"color": "red", "real": "no"})
      Behavior.create(:id => 13, :properties => {"location": "Moscow"})
      post '/build_tree_v1_pdf', body, headers: {'CONTENT_TYPE' => 'application/json'}
      file_path = 'tmp/out.pdf'
      expect(File.file?(file_path)).to be true
    end

  end

end
