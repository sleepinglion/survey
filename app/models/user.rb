class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable
    validates_presence_of :login_id,:name
    validates_uniqueness_of :login_id
    validates_length_of :name, within: 1..60, allow_blank: false
    validates :password, length: { in: 6..128 }, on: :create
    validates :password, length: { in: 6..128 }, on: :update, allow_blank: true
    has_many :users_questions, :dependent=>:destroy
    has_many :questions, :through=>:users_questions
    has_one :user_data
    belongs_to :education
    belongs_to :live_type
    has_many :users_families
    has_many :families, :through=>:users_families

    accepts_nested_attributes_for :families, :allow_destroy => true, reject_if: :reject_families
    mount_uploader :photo, UserUploader

    def reject_families(attributes)
      attributes[:family_category_id].blank?
    end

    def email_required?
        false
    end

    def email_changed?
        false
    end

    def will_save_change_to_email?
        false
    end
end
