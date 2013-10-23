module WeakParameters
  class Middleware
    def initialize(app)
      @app = app
    end
    def call(env)
      @app.call env
    rescue WeakParameters::ValidationError => exception
      data = {:hoge => exception.message}
      res = {
        :session_key => env['rack.session'].id
      }.merge(data).to_xml(:root => "response")
      [400, { "Content-Type" => "text/xml; charset=utf-8" }, [res]]
    end
  end
end
