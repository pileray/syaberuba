class User < ApplicationRecord
  before_save { self.email.downcase! }
  has_secure_password
  validates :name, presence: true, length: {maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :age, presence: true, length: {maximum: 3 }
  validates :job, presence: true, length: {maximum: 20 }
  validates :sex, presence: true
  mount_uploader :image, ImageUploader
  
  has_many :discussions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_discussions, through: :comments, source: :discussion
  has_many :empathies, dependent: :destroy
  has_many :empathy_comments, through: :empathies, source: :comment
  has_many :objections, dependent: :destroy
  has_many :objection_comments, through: :objections, source: :comment
  
  def make_comment( discussion, opinion_comment, learning_comment )
    self.comments.create( discussion_id: discussion.id, opinion: opinion_comment, learning: learning_comment)
  end
end
