defmodule Command_ReplayDeleteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          game_id: integer
        }
  defstruct [:game_id]

  field(:game_id, 1, optional: true, type: :sint32, default: -1)
end
