class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :see_code
      t.string :live_version
      t.string :main_img
      t.string :secondary_img

      t.timestamps
    end
  end
end
