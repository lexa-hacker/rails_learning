class Company < ActiveRecord::Base
	has_many :products, dependent: :delete_all
end
