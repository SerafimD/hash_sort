class BehaviorController < ApplicationController
  #
  # index behaviors
  #
  get '/' do
    @behaviors = Behavior.all
    @behaviors.to_json
  end

  #
  # create new behavior
  #
  post '/' do
    properties = json_params['properties']
    @behavior = Behavior.create(properties: properties)
    render_result @behavior
  end

  #
  # show behavior
  #
  get '/:id' do
    @behavior = Behavior.find_by_id(params[:id])
    @behavior.to_json
  end

  #
  # delete behavior
  #
  delete '/:id' do
    @behavior = Behavior.find_by_id(params[:id])
    if @behavior
      @behavior.destroy
      'deleted'.to_json
    else
      'not found'.to_json
    end
  end

end