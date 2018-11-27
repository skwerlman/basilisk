defmodule ServerInfo_PlayerPing do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          player_id: integer,
          ping_time: integer
        }
  defstruct [:player_id, :ping_time]

  field :player_id, 1, optional: true, type: :sint32
  field :ping_time, 2, optional: true, type: :sint32
end
