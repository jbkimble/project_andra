class AddFrequencyToExperiment < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :photo_frequency, :string
  end
end
