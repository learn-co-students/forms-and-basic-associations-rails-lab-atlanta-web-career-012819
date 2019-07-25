class AddNotesToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :notes, :string
  end
end
