defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the order" do
      user = build(:order)
      OrderAgent.start_link(%{})

      # returns tuple {:ok, uuid} - using pattern matching in assert
      assert {:ok, _uuid} = OrderAgent.save(user)
    end
  end

  describe "get/1" do
    # antes do teste
    setup do
      OrderAgent.start_link(%{})
      :ok
    end

    test "when the order is found, returns the order" do
      order = build(:order)
      {:ok, %{uuid: uuid}} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)
      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = OrderAgent.get("00000000000")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
