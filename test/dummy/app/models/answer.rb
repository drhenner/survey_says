class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :scores
  has_many :survey_images,:as         => :imageable,
                          :order      => :position,
                          :dependent  => :destroy

  validates :question_id, :presence => true
  validates :details,     :presence => true

  accepts_nested_attributes_for :scores, :reject_if => proc { |attributes| attributes['value'].blank? }
  accepts_nested_attributes_for :survey_images, :reject_if => proc { |attributes| attributes['photo'].nil? }

  def display_position
    position ? position.to_s : '*'
  end

  def image(s = :small)
    survey_images.first ? survey_images.first.photo.url(:small) : ''
  end
end
