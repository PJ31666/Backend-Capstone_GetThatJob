class ApplicationsController < ApplicationController
  # el metodo set_user se utiliza solo para las acciones dentro de los corchetes
  before_action :set_user, only: %i[create update destroy]

  # GET /application
  def index
    @applications = Application.all

    render json: @applications
  end

  # GET /application/1
  def show
    render json: @application
  end

  # POST /application
  def create
    @application = Application.new(application_params)
    @application.user_id = @user.id

    if @application.save
      render json: @application, status: :created, location: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /application/1
  def update
    if @application.update(application_params)
      render json: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /application/1
  def destroy
    p params
    @application.destroy
  end

  private

  # http://localhost:3000/users/1/applications
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  def application_params
    params.permit(:professional_experience, :professional_interesed, :new_cv,
                  :job_id, :user_id)
  end
end
