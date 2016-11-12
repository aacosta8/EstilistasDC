class Haircut < ApplicationRecord
	has_attached_file :foto
	validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
