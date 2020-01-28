class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    serialized = {
      id: item.id,
      name: item.name,
      description: item.description,
      num_times_ordered: item.orders.count
    }
    render json: serialized
  end

  def create
    render json: Item.create(item_params)
  end

  def update
    render json: Item.update(params[:id], item_params)
  end

  def destroy
    Item.delete(params[:id])
  end
  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
