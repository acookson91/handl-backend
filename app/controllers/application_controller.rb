class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # include ActionController::MimeResponds
    respond_to :json

end
