class CreateSurveyProperties < ActiveRecord::Migration
  def change
    create_table :survey_properties do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
