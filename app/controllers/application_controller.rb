class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  # no CRSF protection
  skip_before_filter  :verify_authenticity_token

end
