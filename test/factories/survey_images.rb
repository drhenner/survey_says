
Factory.define :survey_image do |s|
  s.imageable  { |c| c.association(:answer) }
  s.position 1
  s.photo_file_name 'My-file-name'
  s.photo_content_type  'image/jpeg'
  s.photo_file_size  1
  s.caption  'My caption... '
end
