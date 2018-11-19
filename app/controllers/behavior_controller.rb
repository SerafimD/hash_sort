class BehaviorController < ApplicationController
  #
  # index behaviors
  #
  get '/' do
    render_result Behavior.all
  end

  #
  # create new behavior
  #
  post '/' do
    render_result Behavior.create(properties: json_params['properties'])
  end

  #
  # show behavior
  #
  get '/:id' do
    render_result behavior
  end

  #
  # delete behavior
  #
  delete '/:id' do
    render_result behavior.destroy
  end

end