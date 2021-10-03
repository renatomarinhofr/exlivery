defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua das bananeiras, 55",
          "Renato",
          "renato@gmail.com",
          "12345678900",
          27
        )

      expected_response = {:ok, build(:user)}

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
