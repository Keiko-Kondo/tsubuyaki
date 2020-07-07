class SaysController < ApplicationController
  before_action :set_say, only: [:show, :edit, :update, :destroy]

  def index
    @says = Say.all
  end

  def show
  end

  def new
    @say = Say.new
  end

  def edit
  end

  def create
    @say = Say.new(say_params)
      if params[:back]
        render :new
      elsif @say.save
        redirect_to @say, notice: 'つぶやきました！'
      else
        render :new
      end
  end

  def update
    if @say.update(say_params)
      redirect_to says_path,notice:"つぶやきを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @say.destroy
      redirect_to says_url, notice: 'つぶやきを削除しました！'
  end

  def confirm
    @say = Say.new(say_params)
    render :new if @say.invalid?
  end

  private
  def set_say
    @say = Say.find(params[:id])
  end

  def say_params
    params.require(:say).permit(:content)
  end
end
