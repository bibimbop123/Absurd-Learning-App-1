class CreateAbsurdStories < ActiveRecord::Migration[8.0]
  def change
    create_table :absurd_stories do |t|
      t.references :learning_concept, null: false, foreign_key: true
      t.references :absurd_theme, null: false, foreign_key: true
      t.text :story_text

      t.timestamps
    end
  end
end
