class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  
  validates :opinion, presence: true, length: { maximum: 250 }
  validates :learning, presence: true, length: { maximum: 250 }
end
