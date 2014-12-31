class HighScoresController < ApplicationController
  before_action :set_login_form, only: [:show, :edit, :update, :destroy]

  def index
    @login_form = HighScore.all
  end
  def show
  end
  def new
    @login_form = HighScore.new
  end
  def edit
  end
  def create
    @login_form = HighScore.new(login_form_params)

    respond_to do |f|
      if @login_form.save
        f.html { redirect_to @login_form, notice: 'High score was successfully created.' }
        f.json { render :show, status: :created, location: @login_form }
      else
        f.html { render :new }
        f.json { render json: @login_form.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |f|
      if @login_form.update(login_form_params)
        f.html { redirect_to @login_form, notice: 'High score was successfully updated.' }
        f.json { render :show, status: :ok, location: @login_form }
      else
        f.html { render :edit }
        f.json { render json: @login_form.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @login_form.destroy
    respond_to do |f|
      f.html { redirect_to login_form_url, notice: 'High score was successfully destroyed.' }
      f.json { head :no_content }
    end
  end

  private
    
    def set_login_form
      @login_form = HighScore.find(params[:id])
    end

    
    def login_form_params
      params.require(:login_form).permit(:game, :score)
    end
end
