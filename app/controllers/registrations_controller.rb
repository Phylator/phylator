class RegistrationsController < Devise::RegistrationsController

    before_action :associate_calculation

    def associate_calculation
        c = Calculation.find(current_user.calculation_id)
        c.user_id = current_user.id
        c.save!
    end

end
