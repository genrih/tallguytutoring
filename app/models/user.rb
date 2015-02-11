class User < ActiveRecord::Base
  has_and_belongs_to_many :milestones
  has_one :inviter, class_name: User
  belongs_to :inviter, class_name: User
end
