class AddQuestionaireIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :questionnaire_id, :integer

    add_index :questions, :questionnaire_id
  end
end
