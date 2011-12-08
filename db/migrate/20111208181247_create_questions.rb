class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :details
      t.boolean :active
      t.integer :position

      t.timestamps
    end
  end
end
