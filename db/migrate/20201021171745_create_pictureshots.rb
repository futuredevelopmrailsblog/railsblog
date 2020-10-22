class CreatePictureshots < ActiveRecord::Migration[6.0]
  def change
    create_table :pictureshots do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :user_pictureshot

      t.timestamps
    end
  end
end
