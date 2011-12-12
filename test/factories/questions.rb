Factory.define :question do |s|
  s.details   'John'
  s.active    true
  s.position  1
end

Factory.define :question_with_questionnaire, :parent => :question do |s|
  s.questionnaire { |c| c.association(:questionnaire) }
  s.details   'John with questionaire'
  s.active    true
  s.position  2
end