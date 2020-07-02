class SaysController < ApplicationController
  before_action :set_say, only: [:show, :edit, :update, :destroy]

  # GET /says
  # GET /says.json
  def index
    @says = Say.all
  end

  # GET /says/1
  # GET /says/1.json
  def show
  end

  # GET /says/new
  def new
    @say = Say.new
  end

  # GET /says/1/edit
  def edit
  end

  # POST /says
  # POST /says.json
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

  # PATCH/PUT /says/1
  # PATCH/PUT /says/1.json
  def update
    if @say.update(say_params)
      redirect_to says_path,notice:"つぶやきを編集しました！"
    else
      render :edit
    end
  end

  # DELETE /says/1
  # DELETE /says/1.json
  def destroy
    @say.destroy
      redirect_to says_url, notice: 'つぶやきを削除しました！' 
  end

  def confirm
    @say = Say.new(say_params)
    render :new if @say.invalid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_say
      @say = Say.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def say_params
      params.require(:say).permit(:content)
    end
end
