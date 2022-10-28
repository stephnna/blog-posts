class ApplicationController < ActionController::Base
  def current_user
    @user = User.find(params[:id])
  end
end
