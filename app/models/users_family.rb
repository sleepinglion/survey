class UsersFamily < ActiveRecord::Base
    validates_presence_of :user_id,:family_id
    belongs_to :user, counter_cache: true
    belongs_to :family
end
