class AffirmationsController < ApplicationController

  def new
    @affirmation = Affirmation.new
  end

  def create
    @affirmation = Affirmation.create(affirmation_params)
    redirect_to root_path, notice: 'Your affirmation has been created! How about another one?'
  end

  private
  def affirmation_params
    params.require(:affirmation).permit(:affirmation)
  end
end
