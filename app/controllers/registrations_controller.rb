class RegistrationsController < Devise::RegistrationsController

    def create
        super
        Calculation.find(self.calculation_id).user_id = self.id
    end

end
