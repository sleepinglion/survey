class Family < ActiveRecord::Base  
    belongs_to :family_category
    has_many :users_families
    has_many :users, :through=>:users_families
end
