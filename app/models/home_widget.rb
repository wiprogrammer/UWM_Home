class HomeWidget < ApplicationRecord
  validates :name, :color, :description, presence: true
  validates :link, url: true


  # Adds new widgets to user settings
  after_create :add_widget_to_users
  def add_widget_to_users
    @users = User.all
    @users.each { |u| UserHomeSetting.create(:home_widget_id => self.id, :user_id => u.id, :visibility => self.default_visibility)}
  end


end
