# == Schema Information
#
# Table name: animals
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  blurb                   :string(255)
#  rating                  :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#
class Animal < ActiveRecord::Base
	default_scope :order => "rating DESC"
	attr_protected :id
  #attr_accessible :blurb, :name, :rating
	has_attached_file :attachment,
		#:default_url => ActionController::Base.helpers.asset_path('default_:style.png'),
		:styles => {
			:thumb => "100x100#",
			:small => "150x150>",
			:medium => "300x300>",
			:large =>  "600x600>" },
		:path => ":attachment/:id/:style.:extension",
		:bucket => 'animalattack2'
	before_save { |animal| animal.name = name.downcase }
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :rating, presence: true
end
