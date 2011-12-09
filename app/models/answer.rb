class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :scores

  validates :question_id, :presence => true
  validates :details,     :presence => true

  def display_position
    position ? position.to_s : '*'
  end
end
