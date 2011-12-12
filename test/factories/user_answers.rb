Factory.define :user_answer do |s|
  s.user  { |c| c.association(:user) }
  s.answer  { |c| c.association(:answer) }
end
