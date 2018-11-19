class ParseErrorsMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue Exception => error
      return [ 400, { "Content-Type" => "application/json" }, [ { status: 400, error: error }.to_json ] ]
    end
  end
end
