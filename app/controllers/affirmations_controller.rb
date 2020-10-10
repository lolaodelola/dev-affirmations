class AffirmationsController < ApplicationController

  def new
    @affirmation = Affirmation.new
  end

  def create
    @affirmation = Affirmation.create(affirmation_params)
    redirect_to root_path
  end

  private
  def affirmation_params
    params.require(:affirmation).permit(:affirmation)
  end
end
