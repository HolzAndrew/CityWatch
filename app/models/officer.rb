class Officer < ApplicationRecord
  belongs_to :city
  
  has_secure_password
end
