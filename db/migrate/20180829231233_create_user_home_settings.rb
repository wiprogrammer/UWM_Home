class CreateUserHomeSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_home_settings do |t|
      t.references :home_widget, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :position
      t.boolean :visibility

      t.timestamps
    end
  end
end
