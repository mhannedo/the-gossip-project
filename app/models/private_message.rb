class PrivateMessage < ApplicationRecord

    belongs_to :sender, class_name: "User" 
    belongs_to :recipient1, class_name: "User"
    belongs_to :recipient2, class_name: "User"

end
