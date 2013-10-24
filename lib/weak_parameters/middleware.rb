module WeakParameters
  class Middleware
    def initialize(app)
      @app = app
    end
    def call(env)
      @app.call env
    rescue WeakParameters::ValidationError => exception
      @app.validation_error exception
    end
  end
end
