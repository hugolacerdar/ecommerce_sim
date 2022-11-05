defmodule EcommerceSim.Producer do
  alias KafkaEx.Protocol.Produce.Message
  alias KafkaEx.Protocol.Produce.Request

  @spec produce(String.t(), map | [map]) :: :ok
  def produce(topic, messages) when is_list(messages) do
    Enum.map(messages, &generate_message/1)

    %Request{topic: topic, messages: messages}
    |> KafkaEx.produce()
  end

  def produce(topic, %{value: _, key: _} = message) do
    %Request{topic: topic, messages: [generate_message(message)]}
    |> KafkaEx.produce()
  end

  defp generate_message(%{value: value, key: key}), do: %Message{value: value, key: key}
end
