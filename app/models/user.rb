class User < ApplicationRecord

    validates :first_name,
        presence: true,
        length: { in: 2..20 }

    validates :last_name,
        presence: true,
        length: { in: 2..20 }

    validates :email, 
        presence: true 

    validates :password,
        presence: true, 
        length: { minimum: 4 }


    belongs_to :city
    has_many :gossips
    has_many :comments
    has_many :private_messages, foreign_key: 'sender_id'
    has_many :private_messages, foreign_key: 'recipient1_id'
    has_many :private_messages, foreign_key: 'recipient2_id'
    has_secure_password

end
