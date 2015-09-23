class ImagesController < ApplicationController
  before_action :current_pregnancy_image, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @images = Image.all.order("fecha DESC").paginate(:page => params[:page], :per_page => 9)

    respond_with @images
  end

  def show
    respond_with @image
  end

  def new
    @image = current_pregnancy.images.new

    respond_with @image
  end

  def edit
    respond_with @image
  end

  def create
    @image = current_pregnancy.images.new image_params

    if @image.save
      flash[:notice] = 'Imagen agregado de forma exitosa.'
      respond_with @image, location: patient_pregnancy_images_path
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :new
    end
  end

  def update
    if @image.update image_params
      flash[:notice] = 'Imagen actualizada de forma exitosa.'
      respond_with @image, location: patient_pregnancy_image_path(:patient_id =>current_patient,
                                                                   :pregnancy_id => current_pregnancy,
                                                                   :image_id => @image.id)
    else
      flash[:error] = 'Ha ocurrido un problema.'
      render :edit
    end
  end

  def destroy
    @image.destroy
    redirect_to patient_pregnancy_images_url, notice: 'Imagen eliminada de forma exitosa.'
  end

  private
    def image_params
      params.require(:image).permit(:pregnancy_id, :fecha, :imagen, :descripcion)
    end
end