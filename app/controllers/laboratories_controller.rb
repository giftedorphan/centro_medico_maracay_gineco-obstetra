class LaboratoriesController < ApplicationController
  before_action :current_laboratory, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @laboratories = Laboratory.all.order("fecha DESC").paginate(:page => params[:page], :per_page => 12)

    respond_with @laboratories
  end

  def show
    respond_with @laboratory
  end

  def new
    @laboratory = current_patient.laboratories.new

    respond_with @laboratory
  end

  def edit
    respond_with @laboratory
  end

  def create
    @laboratory = current_patient.laboratories.new laboratory_params

    if @laboratory.save
      flash[:notice] = 'Laboratorio agregado de forma exitosa.'
      respond_with @laboratory, location: patient_laboratories_path
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :new
    end
  end

  def update
    if @laboratory.update laboratory_params
      flash[:notice] = 'Laboratorio actualizado de forma exitosa.'
      respond_with @laboratory, location: patient_laboratories_path
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :edit
    end
  end

  def destroy
    @laboratory.destroy
    redirect_to patient_laboratories_url, notice: 'Laboratorio eliminado de forma exitosa.'
  end

  private
    def laboratory_params
      params.require(:laboratory).permit(:patient_id, :fecha, :hb, :htc, :vdrl, :glicemia, :orina, :heces)
    end
end