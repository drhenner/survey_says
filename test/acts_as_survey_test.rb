require 'test_helper'

class ActsAsSurveySaysTest < Test::Unit::TestCase
  def test_score_user_should_return_each_properies_score

    friendly_property = Factory(:survey_property, :name => 'friendly')
    pretty_property   = Factory(:survey_property, :name => 'pretty')
    friendly_answer             = Factory(:answer)
    friendly_and_pretty_answer  = Factory(:answer)
    pretty_answer               = Factory(:answer)

    friendly_score_1            = Factory(:score, :answer => friendly_answer, :value => 5, :survey_property => friendly_property)
    friendly_and_pretty_score_1 = Factory(:score, :answer => friendly_and_pretty_answer, :value => 2, :survey_property => friendly_property)
    friendly_and_pretty_score_2 = Factory(:score, :answer => friendly_and_pretty_answer, :value => 1, :survey_property => pretty_property)
    pretty_score_1              = Factory(:score, :answer => pretty_answer, :value => 25, :survey_property => pretty_property)

    friendly_user = Factory(:user)
    Factory(:user_answer, :user => friendly_user, :answer => friendly_answer)
    Factory(:user_answer, :user => friendly_user, :answer => friendly_and_pretty_answer)

    pretty_user = Factory(:user)
    Factory(:user_answer, :user => pretty_user, :answer => pretty_answer)
    Factory(:user_answer, :user => pretty_user, :answer => friendly_and_pretty_answer)

    friendly_scores = friendly_user.score_user!
    pretty_scores   = pretty_user.score_user!

    assert friendly_scores.detect{|s| s.survey_property_id == pretty_property.id}.value == 1
    assert friendly_scores.detect{|s| s.survey_property_id == friendly_property.id}.value == 7

    assert pretty_scores.detect{|s| s.survey_property_id == pretty_property.id}.value == 26
    assert pretty_scores.detect{|s| s.survey_property_id == friendly_property.id}.value == 2

  end

  # score_questionnaire(questionnaire_id)
  def test_score_questionnaire_should_return_each_properies_score
    questionnaire = Factory(:questionnaire)

    friendly_property = Factory(:survey_property, :name => 'friendly')
    pretty_property   = Factory(:survey_property, :name => 'pretty')

    question = Factory(:question, :questionnaire => questionnaire)
    friendly_answer             = Factory(:answer, :question => question)
    friendly_and_pretty_answer  = Factory(:answer, :question => question)
    pretty_answer               = Factory(:answer)

    friendly_score_1            = Factory(:score, :answer => friendly_answer, :value => 5, :survey_property => friendly_property)
    friendly_and_pretty_score_1 = Factory(:score, :answer => friendly_and_pretty_answer, :value => 2, :survey_property => friendly_property)
    friendly_and_pretty_score_2 = Factory(:score, :answer => friendly_and_pretty_answer, :value => 1, :survey_property => pretty_property)
    pretty_score_1              = Factory(:score, :answer => pretty_answer, :value => 25, :survey_property => pretty_property)

    friendly_user = Factory(:user)
    Factory(:user_answer, :user => friendly_user, :answer => friendly_answer)
    Factory(:user_answer, :user => friendly_user, :answer => friendly_and_pretty_answer)

    pretty_user = Factory(:user)
    Factory(:user_answer, :user => pretty_user, :answer => pretty_answer)
    Factory(:user_answer, :user => pretty_user, :answer => friendly_and_pretty_answer)

    friendly_scores = friendly_user.score_questionnaire(questionnaire.id)
    pretty_scores   = pretty_user.score_questionnaire(questionnaire.id)

    assert friendly_scores.detect{|s| s.survey_property_id == pretty_property.id}.value == 1
    assert friendly_scores.detect{|s| s.survey_property_id == friendly_property.id}.value == 7

    # it should not grab the score for pretty_answer because it is not in the questionnaire
    assert pretty_scores.detect{|s| s.survey_property_id == pretty_property.id}.value == 1
    assert pretty_scores.detect{|s| s.survey_property_id == friendly_property.id}.value == 2

  end



  def test_add_answers
    user    = Factory(:user)
    answer  = Factory(:answer)
    answer2 = Factory(:answer)

    user.add_answers([answer.id, answer2.id])
    assert_equal [answer, answer2], user.answers
  end


  #def add_answers(answer_ids)
  #  self.answer_ids = answer_ids | answer_ids
  #  self.save
  #end
end
