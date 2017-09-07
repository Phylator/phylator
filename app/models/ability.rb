class Ability

    include CanCan::Ability

    def initialize user

        can :manage, Calculation, user_id: user.id
        can :read, Calculation, public: true

    end

end
