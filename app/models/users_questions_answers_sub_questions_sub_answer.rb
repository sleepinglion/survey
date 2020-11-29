class UsersQuestionsAnswersSubQuestionsSubAnswer < ActiveRecord::Base
    belongs_to :users_questions_answers_sub_question, counter_cache: true
    belongs_to :sub_answer
    has_many :users_questions_answers_sub_questions_sub_answers_custom_answers, :dependent=>:destroy, :inverse_of=> :users_questions_answers_sub_questions_sub_answer

    accepts_nested_attributes_for :users_questions_answers_sub_questions_sub_answers_custom_answers, :allow_destroy => true
#    validates_presence_of :user_id,:sub_answer_id
    validates_uniqueness_of :users_questions_answers_sub_question, scope: [:sub_answer_id], message: '^Not_allow_insert_same_user_id_and_sub_answer_id'
end
