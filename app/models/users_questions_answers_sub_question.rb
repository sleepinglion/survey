class UsersQuestionsAnswersSubQuestion < ActiveRecord::Base
    belongs_to :users_questions_answer, counter_cache: true
    belongs_to :sub_question
    has_many :users_questions_answers_sub_questions_sub_answers, :inverse_of=> :users_questions_answers_sub_question
    has_many :sub_answers, :through=>:users_questions_answers_sub_questions_sub_answers
    accepts_nested_attributes_for :users_questions_answers_sub_questions_sub_answers, :allow_destroy => true, reject_if: :sub_answer_rejectable?

    #validates_presence_of :users_questions_answer_id,:sub_question_id
    validates_uniqueness_of :users_questions_answer_id, scope: [:sub_question_id], message: '^Not_allow_insert_same_user_id_and_sub_answer_id'

    private

    def sub_answer_rejectable?(att)
      return att[:sub_answer_id].blank?
    end
end
