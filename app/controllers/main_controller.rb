class MainController < ApplicationController

  #
  # POST Sort tree method
  #
  post '/build_hash_tree' do
    content_type :json
    logger = Logger.new 'app/log/data.log'
    params = JSON.parse(request.body.read)
    logger.info "Income data + #{params}"
    response = SortTreeService.new(params).build_tree
    logger.info "Outcome data + #{response}"
    response
  end

end
