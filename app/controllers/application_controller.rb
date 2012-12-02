class ApplicationController < ActionController::Base
  include CartHelper

  before_filter :set_current_user

  # used when user login
  def set_current_user
    User.current_user = current_user
  end

  # redirect path after login
  def after_sign_in_path_for(user)
    "/categories/index"
  end
end
