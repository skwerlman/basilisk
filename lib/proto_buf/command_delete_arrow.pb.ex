defmodule Command_DeleteArrow do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          arrow_id: integer
        }
  defstruct [:arrow_id]

  field :arrow_id, 1, optional: true, type: :sint32, default: -1
end
