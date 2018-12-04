defmodule Command_SetSideboardPlan do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          move_list: [MoveCard_ToZone.t()]
        }
  defstruct [:move_list]

  field(:move_list, 1, repeated: true, type: MoveCard_ToZone)
end
