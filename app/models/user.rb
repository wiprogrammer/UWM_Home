class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  after_create :add_user_settings

  def add_user_settings
    @home_widgets = HomeWidget.all
    @position = 1

    @home_widgets.each do |w|
      UserHomeSetting.create(:home_widget_id => w.id, :user_id => self.id, :position => @position, :visibility => w.default_visibility)
      @position += 1
    end
  end


end
