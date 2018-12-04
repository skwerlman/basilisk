defmodule Command_RollDie do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          sides: non_neg_integer
        }
  defstruct [:sides]

  field(:sides, 1, optional: true, type: :uint32)
end
