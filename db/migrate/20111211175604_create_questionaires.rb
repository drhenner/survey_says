class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :name,  :null => false
    end
    add_index :questionnaires, :name
  end
end
