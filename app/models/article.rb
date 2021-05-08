class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true
    validates :image, presence: true
    belongs_to :author, foreign_key: :user_id, class_name: 'User'
    has_one_attached :image
    belongs_to :category
    has_many :votes
    has_many :comments, dependent: :destroy
end
