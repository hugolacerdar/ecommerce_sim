defmodule EcommerceSim.Serializer do
  @spec encode(map | String.t()) :: binary
  def encode(message) do
    message
    |> :erlang.term_to_binary()
    |> Base.encode64()
  end

  @spec decode(binary) :: String.t() | map
  def decode(encoded_message) do
    encoded_message
    |> Base.decode64!()
    |> :erlang.binary_to_term()
  end
end
