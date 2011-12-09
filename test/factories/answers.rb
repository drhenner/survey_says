Factory.define :answer do |s|
  s.question  { |c| c.association(:question) }
  s.details   'Johns answer'
  s.active    true
  s.position  1
end