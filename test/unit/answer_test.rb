require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test 'Answer should display position as * if it is NULL' do
    answer = Factory(:answer, :position => nil)
    assert answer.display_position == '*'
  end
  test 'Answer should display position' do
    answer = Factory(:answer, :position => 2)
    assert answer.display_position == '2'
  end
end
