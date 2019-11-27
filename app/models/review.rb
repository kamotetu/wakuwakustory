class Review < ApplicationRecord
  belongs_to :user
  belongs_to :story
  belongs_to :maintitle
end
