class TextsController < ApplicationController
  def index
    @texts = Text.visible_to(current_user).all
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    @text.users << current_user
    if @text.save
      flash[:notice] = "'#{@text.title}' was successfully created!"
      redirect_to @text
    else
      flash[:error] = "Sorry, there was a problem creating your text."
      render :new
    end
  end

  def show
    @text = Text.find(params[:id])
  end

  def edit
    @text = Text.find(params[:id])
  end

  def update
    @text = Text.find(params[:id])
    if @text.update_attributes(text_params)
      flash[:notice] = "'#{@text.title}' was successfully updated!"
      redirect_to @text
    else
      flash[:error] = "Sorry, there was a problem updating your text."
      render :edit
    end
  end

  def destroy
    @text = Text.find(params[:id])
    if @text.destroy
      flash[:notice] = "'#{@text.title}' was successfully deleted!"
      redirect_to texts_path
    else
      flash[:error] = "Sorry, there was a problem deleting your text."
      render :show
    end
  end

  private
  def text_params
    params.require(:text).permit(:title, :description, :public, :image)
  end
end
