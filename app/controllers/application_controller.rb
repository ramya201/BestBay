class ApplicationController < ActionController::Base
  include CartHelper


  before_filter :set_current_user

  def set_current_user
    User.current_user = current_user
  end

end
