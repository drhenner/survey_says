class Score < ActiveRecord::Base
  belongs_to :answer
  belongs_to :survey_property

  validates :value,    :presence => true
  validates :survey_property_id,  :presence => true,
                                  :uniqueness => {
                                          :scope    => :answer_id,
                                          :message  => "should have one score per property"
                                                 }
  #validates :answer_id,    :presence => true
end
