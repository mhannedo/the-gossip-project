class City < ApplicationRecord

    validates :name,
        presence: true,
        length: { in: 2..30 }

    validates :zip_code,
        presence: true

    has_many :users 
end
