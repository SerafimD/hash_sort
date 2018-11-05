require './app'

# map the controllers to routes
map('/behavior') { run BehaviorController}
map('/hash') { run TreeController }
