class UsersQuestionsAnswer < ActiveRecord::Base
    belongs_to :users_question, :autosave=>true, counter_cache: true
    belongs_to :answer, :autosave=>true
    has_many :users_questions_answers_custom_answers, :dependent=>:destroy, :inverse_of=> :users_questions_answer
    has_many :users_questions_answers_sub_questions, :dependent=>:destroy, :inverse_of=> :users_questions_answer
    accepts_nested_attributes_for :users_questions_answers_sub_questions, :allow_destroy => true, reject_if: :users_sub_question_rejectable?
    accepts_nested_attributes_for :users_questions_answers_custom_answers, :allow_destroy => true

#    validates_presence_of :users_question_id,:answer_id
    validates_uniqueness_of :users_question_id, scope: [:answer_id], message: '^Not_allow_insert_same_user_id_and_sub_answer_id'

    private

    def users_sub_question_rejectable?(att)
      exists=false

      if self.answer.sub_questions.ids.include?(att[:sub_question_id].to_i)
          exists=true
      end

      unless exists
        return true
      end

      return att[:users_questions_answers_sub_questions_sub_answers_attributes].blank?
    end
end
