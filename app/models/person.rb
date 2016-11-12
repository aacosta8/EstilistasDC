class Person < ApplicationRecord
	belongs_to :ubication
	validates :cedula, uniqueness: true
	has_attached_file :foto_perfil
	validates_attachment_content_type :foto_perfil, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
