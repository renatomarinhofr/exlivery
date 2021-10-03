defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      name: "Renato",
      email: "renato@gmail.com",
      cpf: "12345678900",
      age: 27,
      address: "Rua das bananeiras, 55"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de pepperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end
end
