class PagesController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  def home
    @user = current_user
    if @user
      @user_widgets = UserHomeSetting.where(:user_id => @user.id).order(:position)
    end
  end
end
