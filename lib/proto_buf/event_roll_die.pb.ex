defmodule Event_RollDie do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          sides: non_neg_integer,
          value: non_neg_integer
        }
  defstruct [:sides, :value]

  field(:sides, 1, optional: true, type: :uint32)
  field(:value, 2, optional: true, type: :uint32)
end
