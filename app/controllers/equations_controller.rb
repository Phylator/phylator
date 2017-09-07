class EquationsController < ApplicationController
  before_action :set_equation, only: [:show, :edit, :update, :destroy]

  # GET /equations
  # GET /equations.json
  def index
    @equations = Equation.all
  end

  # GET /equations/1
  # GET /equations/1.json
  def show
  end

  # GET /equations/new
  def new
    @equation = Equation.new
  end

  # GET /equations/1/edit
  def edit
  end

  # POST /equations
  # POST /equations.json
  def create
    @equation = Equation.new(equation_params)

    respond_to do |format|
      if @equation.save
        format.html { redirect_to @equation, notice: 'Equation was successfully created.' }
        format.json { render :show, status: :created, location: @equation }
      else
        format.html { render :new }
        format.json { render json: @equation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equations/1
  # PATCH/PUT /equations/1.json
  def update
    respond_to do |format|
      if @equation.update(equation_params)
        format.html { redirect_to @equation, notice: 'Equation was successfully updated.' }
        format.json { render :show, status: :ok, location: @equation }
      else
        format.html { render :edit }
        format.json { render json: @equation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equations/1
  # DELETE /equations/1.json
  def destroy
    @equation.destroy
    respond_to do |format|
      format.html { redirect_to equations_url, notice: 'Equation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equation
      @equation = Equation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equation_params
      params.fetch(:equation, {})
    end
end
