defmodule Command_IncCardCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone: String.t(),
          card_id: integer,
          counter_id: integer,
          counter_delta: integer
        }
  defstruct [:zone, :card_id, :counter_id, :counter_delta]

  field :zone, 1, optional: true, type: :string
  field :card_id, 2, optional: true, type: :sint32, default: -1
  field :counter_id, 3, optional: true, type: :sint32, default: -1
  field :counter_delta, 4, optional: true, type: :sint32
end
