class BackgroundsController < ApplicationController
  before_action :current_background, only: [:show, :edit, :update]

  respond_to :html, :json

  def show
    respond_with @background
  end

  def new
    @background = current_patient.build_background

    respond_with @background
  end

  private
    def background_params
      params.require(:background).permit(:patient_id, :menarquia, :reglas, :gesta, :paridad, :vivos, :muertos,
                                         :abortos, :mola, :foceps, :cesareas, :gemelares, :podalicos, :prematuros,
                                         :pmf, :otros, :grupo_sangre_embarazada, :rh_embarazada, :grupo_sangre_esposo,
                                         :rh_esposo, :toxoplasmosis, :sensibilizacion)
    end
end