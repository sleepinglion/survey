class UsersQuestion < ActiveRecord::Base
    belongs_to :user, counter_cache: true
    belongs_to :question
    has_many :users_questions_answers, :inverse_of=> :users_question
    has_many :answers, :through=>:users_questions_answers
    accepts_nested_attributes_for :users_questions_answers, :allow_destroy => true, reject_if: :users_answers_rejectable?

    validate :must_have_one_item
    validates_presence_of :user_id,:question_id
    validates_uniqueness_of :user_id, scope: [:question_id], message: '^Not_allow_insert_same_user_id_and_sub_answer_id'

    private

    def must_have_one_item
      errors.add(:items, 'You must select at least one item') unless self.users_questions_answers.detect { |i| i.answer_id != nil }
    end

    def users_answers_rejectable?(att)
      att[:answer_id].blank?
    end
end
