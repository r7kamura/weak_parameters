class APIController < ActionController::API
  rescue_from WeakParameters::ValidationError do
    head 400
  end
end
