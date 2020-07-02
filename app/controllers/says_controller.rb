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

    respond_to do |format|
      if params[:back]
        render :new
      elsif @say.save
        format.html { redirect_to @say, notice: 'Say was successfully created.' }
        format.json { render :show, status: :created, location: @say }
      else
        format.html { render :new }
        format.json { render json: @say.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /says/1
  # PATCH/PUT /says/1.json
  def update
    respond_to do |format|
      if @say.update(say_params)
        format.html { redirect_to @say, notice: 'Say was successfully updated.' }
        format.json { render :show, status: :ok, location: @say }
      else
        format.html { render :edit }
        format.json { render json: @say.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /says/1
  # DELETE /says/1.json
  def destroy
    @say.destroy
    respond_to do |format|
      format.html { redirect_to says_url, notice: 'Say was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.fetch(:say, {})
    end
end
