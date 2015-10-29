class DosesController < ApplicationController

  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.dose.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      reder new
    end
  end



  private

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def dose_params
      params.require(:dose).permit(:description)
    end

end
