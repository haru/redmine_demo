class CreateSampleModels < ActiveRecord::Migration
  def change
    create_table :sample_models do |t|
      t.string :field1
      t.integer :field2
    end
  end
end
