# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)

# require database configurations
require_relative  File.join(APP_ROOT, 'config', 'database')