defmodule Command_ReplayModifyMatch do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          game_id: integer,
          do_not_hide: boolean
        }
  defstruct [:game_id, :do_not_hide]

  field :game_id, 1, optional: true, type: :sint32, default: -1
  field :do_not_hide, 2, optional: true, type: :bool
end
