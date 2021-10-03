defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua das bananeiras",
          "Renato",
          "renato@email.com",
          "123456789",
          27
        )

      expected_response =
        {:ok,
         %User{
           address: "Rua das bananeiras",
           age: 27,
           cpf: "123456789",
           email: "renato@email.com",
           name: "Renato"
         }}

      assert response == expected_response
    end

    test "when there are a invalid params, returns an error" do
      response =
        User.build(
          "Rua das bananeiras",
          "Renato Jr",
          "renato@email.com",
          "123456789",
          15
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
