class Address < ApplicationRecord

	belongs_to :end_user

def full
      postcode + address + name
end
end
