class Discussion < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
  
  validates :title, presence: true, length: { in: 5..50 }
  validates :content, presence: true, length: { maximum: 1000 }
end
