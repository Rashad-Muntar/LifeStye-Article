class Article < ApplicationRecord
    belongs_to :author, foreign_key: :user_id, class_name: 'User'
    has_one_attached :image
    belongs_to :category
    has_many :votes
end
