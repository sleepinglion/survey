class QuestionCategory < ActiveRecord::Base
    validates_presence_of :title
    has_many :questions, :dependent=>:destroy
    has_many :users_questions, :through=>:questions
end
