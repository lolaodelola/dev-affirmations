class DevelopersController < ApplicationController
  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.create(developer_params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def developer_params
    params.require(:developer).permit(:phone_number, :twilio_uid, :confirmed)
  end
end
