class CreateHomeWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :home_widgets do |t|
      t.text :name
      t.text :description
      t.text :color
      t.boolean :default_visibility
      t.text :link

      t.timestamps
    end
  end
end
