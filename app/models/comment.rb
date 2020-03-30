class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  has_many :empathies, dependent: :destroy
  has_many :empathy_users, through: :empathies, source: :user
  has_many :objections, dependent: :destroy
  has_many :objection_users, through: :objections, source: :user
  
  validates :opinion, presence: true, length: { maximum: 250 }
  validates :learning, presence: true, length: { maximum: 250 }
end
