class User < ActiveRecord::Base

  has_many :user_answers
  has_many :answers, :through => :user_answers

  acts_as_survey_says

  def survey_admin?
    true
  end

end