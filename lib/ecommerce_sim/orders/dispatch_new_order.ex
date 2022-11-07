defmodule EcommerceSim.NewOrder.DispatchNewOrder do
  alias EcommerceSim.Producer

  @topic "ECOMMERCE_NEW_ORDER"

  @spec send_message(String.t() | map) :: :ok
  def send_message(message) when is_bitstring(message) do
    key =
      message
      |> String.split(",")
      |> hd()

    Producer.produce(@topic, %{value: message, key: key})
  end

  def send_message(%{data: %{} = data, key: key}) do
    Producer.produce(@topic, %{value: data, key: key})
  end
end
