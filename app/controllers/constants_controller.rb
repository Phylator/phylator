class ConstantsController < ApplicationController

    before_action :authenticate_user!, only: [:show]
    before_action :set_constant, only: [:show]

    # GET /constants/1
    # GET /constants/1.json
    def show
        @animation = 'fadeinright'
        authorize! :read, @constant
        render layout: 'details'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_constant
        @constant = Constant.friendly.find params[:id]
    end

end
