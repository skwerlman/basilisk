defmodule Command_IncCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          counter_id: integer,
          delta: integer
        }
  defstruct [:counter_id, :delta]

  field :counter_id, 1, optional: true, type: :sint32, default: -1
  field :delta, 2, optional: true, type: :sint32
end
