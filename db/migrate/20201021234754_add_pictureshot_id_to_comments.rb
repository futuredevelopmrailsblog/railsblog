class AddPictureshotIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :pictureshot_id, :integer
  end
end
