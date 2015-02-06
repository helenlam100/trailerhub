class Review < ActiveRecord::Base
  belongs_to :trailer
  belongs_to :user
end
