class TreeController < ApplicationController

  #
  # POST Sort tree method
  #
  post '/build_tree' do
    content_type :json
    params = JSON.parse(request.body.read)
    SortTreeService.new(params).build_tree
  end

end
