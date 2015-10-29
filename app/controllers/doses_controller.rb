class DosesController < ApplicationController

  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      reder 'new'
    end
  end


  private

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end

end
