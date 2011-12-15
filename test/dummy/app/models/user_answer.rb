class UserAnswer < ActiveRecord::Base

  belongs_to :user
  belongs_to :answer

end
