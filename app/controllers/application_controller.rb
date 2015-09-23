class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :patient_background, :patient_laboratory ,:patient_pregnancy, :current_patient,
                :current_background, :current_laboratory, :current_pregnancy, :current_pregnancy_control
                :current_pregnancy_image

  def patient_background
    if current_patient.background.nil?
      @patient_background_path = new_patient_background_path(:patient_id => current_patient.id)
    else
      @patient_background_path = patient_background_path(:patient_id => current_patient.id, :background_id => current_patient.background.id)
    end
  end

  def patient_laboratory
    if current_patient.laboratories.empty?
      @patient_laboratory_path = new_patient_laboratory_path(:patient_id => current_patient.id)
    else
      @patient_laboratory_path = patient_laboratories_path(:patient_id => current_patient.id)
    end
  end

  def patient_pregnancy
    if current_patient.pregnancies.empty?
      @patient_pregnancy_path = new_patient_pregnancy_path(:patient_id => current_patient.id)
    else
      @patient_pregnancy_path = patient_pregnancies_path(:patient_id => current_patient.id)
    end
  end

  def current_patient
    @patient = Patient.find_by_id params[:patient_id]
  end

  def current_background
    @background = current_patient.background
  end

  def current_laboratory
    @laboratory = current_patient.laboratories.find_by_id params[:laboratory_id]
  end

  def current_pregnancy
    @pregnancy = current_patient.pregnancies.find_by_id params[:pregnancy_id]
  end

  def current_pregnancy_control
    @control = current_pregnancy.controls.find_by_id params[:control_id]
  end

  def current_pregnancy_image
    @image = current_pregnancy.images.find_by_id params[:image_id]
  end
end