class ParseErrorsMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue Exception => error
      error_output = "There was a problem in you submitted: #{error}"
      return [
          400, { "Content-Type" => "application/json" },
          [ { status: 400, error: error_output }.to_json ]
      ]
    end
  end
end
