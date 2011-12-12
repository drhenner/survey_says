class CreateQuestionaires < ActiveRecord::Migration
  def change
    create_table :questionaires do |t|
      t.string :name,  :null => false
    end
    add_index :questionaires, :name
  end
end
