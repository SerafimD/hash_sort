class MainController < ApplicationController

  #
  # POST Sort tree method
  #
  post '/build_hash_tree' do
    content_type :json
    SortTreeService.new(JSON.parse(request.body.read)).build_tree
  end

end
