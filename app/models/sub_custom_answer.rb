class SubCustomAnswer < ActiveRecord::Base
    validates_presence_of :answer_id, :title
    belongs_to :answer, counter_cache: true

    mount_uploader :photo, SubAnswerUploader
end
