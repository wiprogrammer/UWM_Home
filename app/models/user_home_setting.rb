class UserHomeSetting < ApplicationRecord
  belongs_to :home_widget
  belongs_to :user
end
