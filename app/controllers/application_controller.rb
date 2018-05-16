class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActionView::MissingTemplate do |exception|
    # use exception.path to extract the path information
    # This does not work for partials
    # For now, however, we're just going to display an error message:
    render text: 'There was an internal error. Please refresh and try again.'
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
