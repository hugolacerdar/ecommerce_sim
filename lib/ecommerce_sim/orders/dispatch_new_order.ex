defmodule EcommerceSim.NewOrder.DispatchNewOrder do
  alias EcommerceSim.Producer

  @topic "ECOMMERCE_NEW_ORDER"

  @spec send_message(String.t()) :: :ok
  def send_message(message) do
    key =
      message
      |> String.split(",")
      |> hd()

    Producer.produce(@topic, %{value: message, key: key})
  end
end
