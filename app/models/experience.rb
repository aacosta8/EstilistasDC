class Experience < ApplicationRecord
	belongs_to :person
	
	has_attached_file :foto_exp
	validates_attachment_content_type :foto_exp, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
