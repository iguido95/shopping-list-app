class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_same_user!, only: [:edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @my_items = current_user.items
    # @other_items = Item.where.not(user: current_user).or(Item.where("user_id IS NULL"))
    #users = User.where("(first_name = ? and last_name = ?) or email = ?", first_name, last_name, email)
    @other_items = Item.where("user_id <> ? OR user_id IS NULL", current_user.id)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_same_user!
      unless @item.user_id? && @item.user == current_user
        flash[:danger] = "This is not your item!"
        redirect_to items_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :barcode)
    end
end
