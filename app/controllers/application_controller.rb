class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session # for disable control, CSRF Token

end
