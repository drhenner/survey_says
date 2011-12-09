class Question < ActiveRecord::Base
  has_many :answers, :order => 'answers.position desc'
  has_many :active_answers, :class_name => 'Answer',
                            :conditions => ["answers.active = ?", true],
                            :order => 'answers.position desc'

  validates :details,    :presence => true

  accepts_nested_attributes_for :answers#, :reject_if => proc { |attributes| attributes['details'].blank? }
end
