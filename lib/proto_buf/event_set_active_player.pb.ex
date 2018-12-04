defmodule Event_SetActivePlayer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          active_player_id: integer
        }
  defstruct [:active_player_id]

  field(:active_player_id, 1, optional: true, type: :sint32)
end
