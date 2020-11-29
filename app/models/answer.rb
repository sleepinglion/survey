class Answer < ActiveRecord::Base
    validates_presence_of :question_id, :title
    belongs_to :question, counter_cache: true
    has_many :sub_questions, -> { order 'id asc' }, :dependent=>:destroy

    mount_uploader :photo, AnswerUploader
    validates_uniqueness_of :question_id, scope: [:title], message: '^Not_allow_insert_same_user_id_and_sub_answer_id'

    def answer_text
      if photo?
        return ActionController::Base.helpers.image_tag(photo.medium_thumb.url)
      else
        return title
      end
    end
end
