module Api
  class ItemsController < Api::ApiController

    def index
      if params[:search].nil?
        items = current_user.items
      else
        items = Item.where("name ILIKE ? OR barcode ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").limit(10)
      end
      render json: items, response: :ok
    end

    def show
      item = Item.find(params[:id])
      render json: item, status: :ok #of status: 200
    end



  end
end
