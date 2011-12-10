class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, :null => false
      t.text :details
      t.boolean :active, :default => true
      t.integer :position

      t.timestamps
    end

    add_index :answers, :question_id
  end
end
