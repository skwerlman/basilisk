defmodule Context_Mulligan do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          number: non_neg_integer
        }
  defstruct [:number]

  field :number, 1, optional: true, type: :uint32
end
