class Product < ActiveRecord::Base
  attr_accessible :image, :price, :description, :category_id
  belongs_to :category

  validates :image, :presence => true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 100}
  validates :description, :presence => true
  LARGE_IMAGE_SIZE = "300x300"
  SMALL_IMAGE_SIZE = "81x81"
  #MEDIUM_SMALL_IMAGE_SIZE = "180x84"
  SMALL_TINY_IMAGE_SIZE = "40x40"
  

  has_attached_file :image, 
      :path => ":rails_root/public/system/product/:id/:style/:filename",
      :url => "/system/product/:id/:style/:filename",
      :styles => { 
      :large => "#{LARGE_IMAGE_SIZE}",
      :small=> "#{SMALL_IMAGE_SIZE}>",
      #:medium=>"#{MEDIUM_IMAGE_SIZE}>",
      :small_tiny => "#{SMALL_TINY_IMAGE_SIZE}>"
    
    }
end
