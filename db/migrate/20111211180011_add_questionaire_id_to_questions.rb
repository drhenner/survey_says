class AddQuestionaireIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :questionaire_id, :integer

    add_index :questions, :questionaire_id
  end
end
