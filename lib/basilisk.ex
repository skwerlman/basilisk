defmodule Basilisk do
  @moduledoc """
  Documentation for Basilisk.
  """

  @server_name Application.get_env(:basilisk, :server_name, "My Basilisk Server")
  @version Mix.Project.config()[:version]

  def server_name do
    @server_name
  end

  def version do
    @version
  end
end
