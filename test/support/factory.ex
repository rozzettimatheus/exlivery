defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Gabriel",
      email: "gabriel@email.com",
      cpf: "12345678900",
      age: 26,
      address: "Rua teste, 123"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de peperoni",
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua teste, 123",
      items: [
        build(:item),
        build(:item,
          description: "Temaki",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("30.00")
        )
      ],
      total_price: Decimal.new("95.50"),
      user_cpf: "12345678900"
    }
  end
end
