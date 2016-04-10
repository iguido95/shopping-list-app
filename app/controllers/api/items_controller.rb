module Api
  class ItemsController < Api::ApiController
    # before_action :authenticate_user


    def index
      if params[:search].nil?
        items = @current_user.items
      else
        items = Item.where("name ILIKE ? OR barcode ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").limit(10)
      end
      render json: items, response: :ok
    end

    def show
      item = Item.find(params[:id])
      render json: item, status: :ok #of status: 200
    end



    # protected
    # def authenticate_user
    #   authenticate_or_request_with_http_token do |token, options|
    #     @current_user = User.find_by(authentication_token: token)
    #   end
    # end


  end
end
