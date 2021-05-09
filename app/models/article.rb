class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true
    validates :image, presence: true, content_type: [:png, :jpg, :jpeg]

    belongs_to :author, foreign_key: :user_id, class_name: 'User'
    has_one_attached :image, dependent: :destroy
    belongs_to :category
    has_many :votes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
end
