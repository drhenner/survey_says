class CreateQuestionaires < ActiveRecord::Migration
  def change
    create_table :questionaires do |t|
      t.string :name

      t.timestamps
    end
  end
end
