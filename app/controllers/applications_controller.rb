class ApplicationsController < ApplicationController

  def index
    @applications = Applications.all
    render json: @applications
  end

  def create
    @application = Applications.new(application_params)

    if @application.save
      render json: @application, status: :created, location: @application
    else
      render json: @application.errors, status: :unprocessable_entity
  end

  private

  def application_params
    params.require(:application).permit(:professional_experience,:professional_interesed)
  end
end
