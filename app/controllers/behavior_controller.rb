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
    properties = JSON.parse(request.body.read)['properties']
    if properties.size <= 10
      @behavior = Behavior.create(properties: properties.to_json)
      return @behavior.to_json
    end
    'no more than 10'.to_json
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