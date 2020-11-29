class UserAbility
    include CanCan::Ability
    def initialize(user)
        cannot :manage, :all
        can :edit, [User]
        can :manage, [UsersQuestion,UsersQuestionsAnswer]
        if user
            can :read, [Home,Question]
            can :manage, [UsersQuestion]
        end
    end
end
