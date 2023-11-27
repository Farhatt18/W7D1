class CatsController < ApplicationController
  def index 
    @cats = Cat.all
    # render json: @cat 
  end

  def show 
    @cat = Cat.find_by(params[:id])
  end

  def create 
    @cat = Cat.new(cat_params)
    if @cat.save 
      redirect_to cats_url
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end

  def new 
    render :new
  end

  def update 
    @cat = Cat.find_by(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end

  def edit 
    render :edit 
  end

  private 

  def cat_params 
    params.require(:cats).permit(:name, :color, :sex, :birth_date, :description)
  end
end
