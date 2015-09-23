class PregnanciesController < ApplicationController
  before_action :current_pregnancy, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @pregnancies = Pregnancy.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 7)

    respond_with @pregnancies
  end

  def show
    respond_with @pregnancy
  end

  def new
    @pregnancy = current_patient.pregnancies.new

    respond_with @pregnancy
  end

  def edit
    respond_with @pregnancy
  end

  def create
    @pregnancy = current_patient.pregnancies.new pregnancy_params

    if @pregnancy.save
      flash[:notice] = 'Embarazo agregado de forma exitosa.'
      respond_with @pregnancy, location: patient_pregnancies_path(:patient_id =>current_patient)
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :new
    end
  end

  def update
    if @pregnancy.update pregnancy_params
      flash[:notice] = 'Embarazo actualizado de forma exitosa.'
      respond_with @pregnancy, location: patient_pregnancies_path(:patient_id =>current_patient)
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :edit
    end
  end

  def destroy
    @pregnancy.destroy
    redirect_to patient_pregnancies_url, notice: 'Embarazo eliminado de forma exitosa.'
  end

  private
    def pregnancy_params
      params.require(:pregnancy).permit(:patient_id, :status, :fur, :fpp)
    end
end