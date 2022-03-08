defmodule Exlivery do
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrder

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  # Facade pattern (Fachada)
  # modulo fachada, unico modulo q o user conhece
  #  delega para modulos internos

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
end
