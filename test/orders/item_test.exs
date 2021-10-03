defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("Pizza de pepperoni", :pizza, "35.5", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, return an error" do
      response = Item.build("Pizza de pepperoni", :banana, "35.5", 1)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is a invalid price, return an error" do
      response = Item.build("Pizza de pepperoni", :pizza, "banana", 1)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is a invalid quantity, return an error" do
      response = Item.build("Pizza de pepperoni", :pizza, "35.5", 0)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
