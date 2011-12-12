class User < ActiveRecord::Base

  has_many :user_answers
  has_many :answers, :through => :user_answers

  def survey_admin?
    true
  end
end