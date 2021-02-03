defmodule Basilisk do
  @moduledoc """
  Documentation for Basilisk.
  """

  @version Mix.Project.config()[:version]

  @spec server_name() :: String.t()
  def server_name do
    Application.get_env(:basilisk, :server_name, "My Basilisk Server")
  end

  @spec version() :: String.t()
  def version do
    @version
  end
end
