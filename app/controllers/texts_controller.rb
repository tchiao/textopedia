class TextsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def text_params
    params.require(:text).permit(:title, :description, :public)
  end
end
