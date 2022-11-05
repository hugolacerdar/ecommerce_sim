defmodule EcommerceSim.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {EcommerceSim.FraudDetectorService.ConsumerOne, []},
      {EcommerceSim.FraudDetectorService.ConsumerTwo, []},
      {EcommerceSim.MailService.Consumer, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleKafkaProducerAndConsumer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
