defmodule Basilisk.Client.Session do
  @moduledoc false
  @type t :: %{
          :client_id => String.t(),
          :client_version => String.t(),
          :node_id => node(),
          :session_start => DateTime.t()
        }

  defstruct client_id: nil,
            client_version: nil,
            node_id: Node.self(),
            session_start: DateTime.utc_now()
end
