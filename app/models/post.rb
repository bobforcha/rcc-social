class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :type, presence: true

  has_many :comments, dependent: :destroy

  def cached_comment_count
    Rails.cache.fetch [self, "comment_count"] do
      comments.size
    end
  end
end
