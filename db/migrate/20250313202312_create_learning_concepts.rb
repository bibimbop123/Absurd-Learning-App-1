class CreateLearningConcepts < ActiveRecord::Migration[8.0]
  def change
    create_table :learning_concepts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
