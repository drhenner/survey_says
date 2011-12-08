class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :answer_id
      t.integer :survey_property_id
      t.integer :value

      t.timestamps
    end
  end
end
