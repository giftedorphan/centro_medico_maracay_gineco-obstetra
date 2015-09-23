class PatientsController < ApplicationController
  before_action :current_patient, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @patients = Patient.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 9)

    respond_with @patients
  end

  def show
    respond_with @patient
  end

  def new
    @patient = Patient.new

    respond_with @patient
  end

  def edit
    respond_with @patient
  end

  def create
    @patient = Patient.new patient_params

    if @patient.save
      flash[:notice] = 'Datos registrados de forma exitosa.'
      respond_with @patient
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :new
    end
  end

  def update
    @patient.assign_attributes patient_params

    if @patient.save
      unless params[:patient].has_key? :background_attributes
        flash[:notice] = 'Paciente actualizado de forma exitosa.'
        respond_with @patient, location: patient_path
      else
        flash[:notice] = 'Antecedente actualizado de forma exitosa.'
        redirect_to patient_background_path(:background_id => current_background.id)
      end
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      flash[:notice] = 'Paciente eliminado de forma exitosa.'
      respond_with @patient, location: patients_path
    else
      flash[:error] = 'Ha ocurrido un problema.'
      redirect_to patient_path
    end
  end

  def search
    @patient = Patient.find_by_cedula params[:search_cedula]

    if @patient
      flash[:notice] = 'Paciente encontrado de forma exitosa.'
      redirect_to patient_path(@patient)
    else
      flash[:error] = 'Paciente no encontrado.'
      redirect_to patients_path
    end
  end

  private
    def patient_params
      params.require(:patient).permit(:avatar, :nombre, :apellido, :edad, :direccion, :cedula, background_attributes:[:id, :patient_id, :menarquia, :reglas, :gesta, :paridad, :vivos, :muertos,
                                         :abortos, :mola, :foceps, :cesareas, :gemelares, :podalicos, :prematuros,
                                         :pmf, :otros, :grupo_sangre_embarazada, :rh_embarazada, :grupo_sangre_esposo,
                                         :rh_esposo, :toxoplasmosis, :sensibilizacion])
    end
end