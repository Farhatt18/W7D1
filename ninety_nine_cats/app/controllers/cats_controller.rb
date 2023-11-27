class CatsController < ApplicationController
  def index 
    @cats = Cat.all
    # render json: @cat 
  end

  def show 
    @cat = Cat.find(params[:id])
  end

  def create 
    # debugger
    @cat = Cat.new(cat_params)

    if @cat.save 
      redirect_to cat_url(@cat)
    else
      debugger
      # render json: @cat.errors.full_messages, status: 422
      render :new
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
    params.require(:cat).permit(:name, :color, :sex, :birth_date, :description)
  end
end
