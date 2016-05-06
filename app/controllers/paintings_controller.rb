class PaintingsController < ApplicationController
  before_action :set_painting, only: [:edit, :update]
  before_action :build_painting, only: [:new, :create, :edit, :update]

  def index
    @paintings = Painting.all
  end

  def new
  end

  def create
    respond_to do |format|
      if @painting.save
        format.html { redirect_to root_path, notice: 'Painting was successfully created.' }
        format.js { @success_message = "Ok" }
      else
        format.html { render 'new' }
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @painting.save
      redirect_to root_path, :notice => "Painting was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    if params[:id] == "all"
      destroy_all
    else
      destroy_one
    end
  end

  private

  def destroy_one
    set_painting
    if @painting.destroy
      flash[:notice] = "Painting was deleted."
    end
    redirect_to root_path
  end

  def destroy_all
    if Painting.delete_all
      flash[:notice] = "All paintings was deleted."
    end
    redirect_to root_path
  end

  def set_painting
    @painting = Painting.find(params[:id])
  end

  def build_painting
    @painting ||= Painting.new
    @painting.attributes = painting_params
  end

  def painting_params
    var = params[:painting]
    var ? var.permit(:name, :image) : {}
  end

end
