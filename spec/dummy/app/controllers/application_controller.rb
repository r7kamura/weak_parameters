class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from WeakParameters::ValidationError do
    head 400
  end
end
