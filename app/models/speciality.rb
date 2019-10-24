class Speciality < ApplicationRecord
	has_many :spe_docs
	has_many :doctors, through: :spe_docs
end
