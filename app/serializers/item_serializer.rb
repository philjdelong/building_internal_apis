class ItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :description

  attribute :name_backwards do |item|
    item.name.reverse
  end

  has_many :orders
  # def initialize(item)
  #   @name = item.name
  #   @description = item.description
  #   @name_backwards = item.name.reverse
  # end
  #
  # def as_json(args)
  #   {
  #     name: @item.name,
  #     description: @item.description,
  #     name_backwards: @item.name.reverse
  #   }
  # end
end
