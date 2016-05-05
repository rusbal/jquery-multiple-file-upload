class PaintingsController < ApplicationController
  before_action :set_painting, only: [:edit, :update, :destroy]
  before_action :build_painting, only: [:new, :create, :edit, :update]

  def index
    @paintings = Painting.all
  end

  def new
  end

  def create
    if @painting.save
      redirect_to root_path, :notice => "New painting was successfully saved."
    else
      render 'new'
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
    if @painting.destroy
      flash[:notice] = "Painting was deleted."
    end
    redirect_to root_path
  end

  private

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
