class AddChartToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :chart_value, :string
    add_column :images, :top_emotion, :string
  end
end
