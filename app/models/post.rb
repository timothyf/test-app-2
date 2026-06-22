class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :body, presence: true

  scope :published, -> { where(published: true).order(published_at: :desc) }
  scope :draft, -> { where(published: false).order(created_at: :desc) }
end
