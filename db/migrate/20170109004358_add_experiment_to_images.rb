class AddExperimentToImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :experiment, foreign_key: true
  end
end
