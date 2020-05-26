class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
    redirect_to new_picture_path, notice: '投稿しました'
    else
    render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
