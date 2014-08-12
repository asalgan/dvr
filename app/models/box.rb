class Box < ActiveRecord::Base
  belongs_to :dvr_system
  has_many :shows

end
