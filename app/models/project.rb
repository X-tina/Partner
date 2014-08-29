class Project < ActiveRecord::Base
  
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true

  scope :order_desc, -> { order('created_at desc') }

end
