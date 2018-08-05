class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
