Factory.define :score do |s|
  s.answer  { |c| c.association(:answer) }
  s.survey_property  { |c| c.association(:survey_property) }
  s.value  1
end
