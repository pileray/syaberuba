class Discussion < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
  
  validates :title, presence: true, length: { in: 5..30 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :assent_comment, length: { maximum: 500 }
end
