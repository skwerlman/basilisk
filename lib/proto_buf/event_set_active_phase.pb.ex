defmodule Event_SetActivePhase do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          phase: integer
        }
  defstruct [:phase]

  field :phase, 1, optional: true, type: :sint32
end
