defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      UserAgent.start_link(%{})
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when the user is found, returns the user" do
      :user
      |> build(cpf: "78945612300")
      |> UserAgent.save()

      response = UserAgent.get("78945612300")

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua das bananeiras, 55",
           age: 27,
           cpf: "78945612300",
           email: "renato@gmail.com",
           name: "Renato"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("00000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
