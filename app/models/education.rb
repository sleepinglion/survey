class Education < ActiveRecord::Base
    validates_presence_of :title
    has_many :user_datas  
end
