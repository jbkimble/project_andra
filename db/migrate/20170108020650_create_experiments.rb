class CreateExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :experiments do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :hypothesis
      t.string :description
      t.string :minutes

      t.timestamps
    end
  end
end
