class Userfollowboat < ActiveRecord::Base
  belongs_to :user
  belongs_to :boat
end
