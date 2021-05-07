class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :articles, dependent: :destroy
    has_many :votes, dependent: :destroy

    
    before_save { name.downcase! }
end
