defmodule Command_KickFromGame do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          player_id: integer
        }
  defstruct [:player_id]

  field(:player_id, 1, optional: true, type: :sint32, default: -1)
end
