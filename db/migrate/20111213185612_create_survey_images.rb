class CreateSurveyImages < ActiveRecord::Migration
  def change
    create_table :survey_images do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.integer :position
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.string :caption

      t.timestamps
    end
  end
end
