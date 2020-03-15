defmodule Basilisk.Client.Session do
  @moduledoc """
  A
  """

  @type vanilla_feature ::
          :"2.6.1_min_version"
          | :client_id
          | :client_ver
          | :client_warnings
          | :feature_set
          | :forgot_password
          | :idle_client
          | :mod_log_lookup
          | :room_chat_history
          | :user_ban_history

  @type basilisk_feature :: :basilisk_knowledge

  @type feature :: vanilla_feature() | basilisk_feature()

  @type features :: [feature()]

  @type t :: %{
          :client_id => String.t(),
          :client_version => String.t(),
          :client_features => features(),
          :node_id => node(),
          :session_start => DateTime.t()
        }

  defstruct client_id: nil,
            client_version: nil,
            client_features: [],
            node_id: Node.self(),
            session_start: DateTime.utc_now()
end
