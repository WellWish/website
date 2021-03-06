class WishesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_wish, only: [:show, :edit, :update, :destroy]

  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = Wish.all
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
  end

  # GET /wishes/new
  def new
    @wish = Wish.new
  end

  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes
  # POST /wishes.json
  def create
    @wish = current_user.wishes.build(wish_params)

    respond_to do |format|
      if @wish.save
        format.html do
          redirect_to @wish, notice: "Wish was successfully created."
        end
        format.json { render :show, status: :created, location: @wish }
      else
        format.html { render :new }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishes/1
  # PATCH/PUT /wishes/1.json
  def update
    respond_to do |format|
      if @wish.update(wish_params)
        format.html do
          redirect_to @wish, notice: "Wish was successfully updated."
        end
        format.json { render :show, status: :ok, location: @wish }
      else
        format.html { render :edit }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish.destroy
    respond_to do |format|
      format.html do
        redirect_to wishes_url, notice: "Wish was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wish
    @wish = Wish.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def wish_params
    params.require(:wish).permit(:title, :description, :criteria)
  end
end
