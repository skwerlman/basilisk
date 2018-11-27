defmodule Command_SetActivePhase do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          phase: non_neg_integer
        }
  defstruct [:phase]

  field :phase, 1, optional: true, type: :uint32
end
