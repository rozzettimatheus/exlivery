defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Order, Item}

  # valores default com \\
  def create(filename \\ "report.csv") do
    order_list = build_order_list()

    File.write(filename, order_list)
  end

  defp build_order_list() do
    OrderAgent.list_all()
    |> Map.values()
    |> Enum.map(fn order -> order_to_string(order) end)
  end

  defp order_to_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    items_string = Enum.map(items, &item_to_string(&1))

    "#{cpf},#{items_string},#{total_price}\n"
  end

  defp item_to_string(%Item{category: category, quantity: quantity, unity_price: unity_price}) do
    "#{category},#{quantity},#{unity_price}"
  end
end
