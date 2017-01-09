class AddEmotionsToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :anger, :string
    add_column :images, :contempt, :string
    add_column :images, :disgust, :string
    add_column :images, :fear, :string
    add_column :images, :happiness, :string
    add_column :images, :neutral, :string
    add_column :images, :sadness, :string
    add_column :images, :surprise, :string
  end
end
