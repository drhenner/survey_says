class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :scores

  validates :question_id, :presence => true
  validates :details,     :presence => true

  accepts_nested_attributes_for :scores, :reject_if => proc { |attributes| attributes['value'].blank? }

  def display_position
    position ? position.to_s : '*'
  end
end
