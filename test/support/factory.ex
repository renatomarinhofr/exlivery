defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Renato",
      email: "renato@gmail.com",
      cpf: "12345678900",
      age: 27,
      address: "Rua das bananeiras, 55"
    }
  end
end
