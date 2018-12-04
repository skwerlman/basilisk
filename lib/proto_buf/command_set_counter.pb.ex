defmodule Command_SetCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          counter_id: integer,
          value: integer
        }
  defstruct [:counter_id, :value]

  field(:counter_id, 1, optional: true, type: :sint32, default: -1)
  field(:value, 2, optional: true, type: :sint32)
end
