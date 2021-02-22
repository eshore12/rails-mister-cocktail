class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.order(name: :asc)
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.order(name: :asc)
      render :new
    end
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # no longer needed because removed nesting in route
    @dose = Dose.find(params[:id])
    if @dose.update(dose_params)
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :edit
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail)
  end
end
