class SubQuestion < ActiveRecord::Base
    validates_presence_of :answer_id,:title
    belongs_to :answer, counter_cache: true
    has_many :sub_answers, -> { order 'id asc' }, :dependent=>:destroy
end
