class CommentsController < ApplicationController
  before_action :set_picture, only: [:create, :edit, :update]
  def create
    @comment = @picture.comments.build(comment_params)

    respond_to do |f|
      if @comment.save
        # f.html { redirect_to picture_path(@picture) }
        f.js { render :index }
      else
        f.html { redirect_to picture_path(@picture), notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    @comment = @picture.comments.find(params[:id])
    respond_to do |f|
      flash.now[:notice] = 'コメントの編集中'
      f.js { render :edit }
    end
  end

  def update
    @comment = @picture.comments.find(params[:id])
    respond_to do |f|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        f.js { render :index }
      else
        flash.now[:notice] = 'コメントが編集されました'
        f.js { render :edit_error }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |f|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:picuture_id, :content)
  end
  def set_picture
    @picture = Picture.find(params[:picture_id])
  end
end
