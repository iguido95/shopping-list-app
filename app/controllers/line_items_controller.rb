class LineItemsController < ApplicationController
  before_action :authenticate_user!

  # GET /line_items
  # GET /line_items.json
  def index
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:comment, :amount, :list_id, :item_id)
    end
end
