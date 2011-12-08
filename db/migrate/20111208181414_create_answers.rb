class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :details
      t.boolean :active
      t.integer :position

      t.timestamps
    end
  end
end
