class Gossip < ApplicationRecord

    validates :title,
        presence: true, 
        uniqueness: true
        
    validates :content, 
        presence: true

    validates :user, 
        presence: true 

    belongs_to :user
    has_many :comments
    has_many :join_tag_gossips
    has_many :tags, through: :join_tag_gossips
end

