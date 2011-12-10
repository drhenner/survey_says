class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :answer_id
      t.integer :survey_property_id
      t.integer :value

      t.timestamps
    end

    add_index :scores, :answer_id
    add_index :scores, :survey_property_id

  end
end
