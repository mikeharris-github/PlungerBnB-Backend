class Delivery < ActiveRecord::Base
  belongs_to :deliverer, class_name: "User"
  belongs_to :requestor, class_name: "User"

end
