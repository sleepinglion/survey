class SubAnswer < ActiveRecord::Base
    validates_presence_of :sub_question_id, :title
    belongs_to :sub_question, counter_cache: true

    mount_uploader :photo, SubAnswerUploader

    def answer_text
      if photo?
        return ActionController::Base.helpers.image_tag(photo.medium_thumb.url)
      else
        return title
      end
    end    
end
