class ControlsController < ApplicationController
  before_action :current_pregnancy_control, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @controls = Control.all.order("fecha DESC").paginate(:page => params[:page], :per_page => 7)

    respond_with @controls
  end

  def show
    respond_with @control
  end

  def new
    @control = current_pregnancy.controls.new

    respond_with @control
  end

  def edit
    respond_with @control
  end

  def create
    @control = current_pregnancy.controls.new control_params

    if @control.save
      flash[:notice] = 'Control agregado de forma exitosa.'
      respond_with @control, location: patient_pregnancy_controls_path
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :new
    end
  end

  def update
    if @control.update control_params
      flash[:notice] = 'Control actualizado de forma exitosa.'
      respond_with @control, location: patient_pregnancy_controls_path(:patient_id =>current_patient,
                                                                 :pregnancy_id => current_pregnancy)
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :edit
    end
  end

  def destroy
    @control.destroy
    redirect_to patient_pregnancy_controls_url, notice: 'Control eliminado de forma exitosa.'
  end

  private
    def control_params
      params.require(:control).permit(:pregnancy_id, :fecha, :eg, :au, :ta, :peso, :present, :ff, :edemas)
    end
end