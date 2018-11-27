defmodule Command_DelCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          counter_id: integer
        }
  defstruct [:counter_id]

  field :counter_id, 1, optional: true, type: :sint32, default: -1
end
