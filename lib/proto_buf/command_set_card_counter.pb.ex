defmodule Command_SetCardCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone: String.t(),
          card_id: integer,
          counter_id: integer,
          counter_value: integer
        }
  defstruct [:zone, :card_id, :counter_id, :counter_value]

  field :zone, 1, optional: true, type: :string
  field :card_id, 2, optional: true, type: :sint32, default: -1
  field :counter_id, 3, optional: true, type: :sint32, default: -1
  field :counter_value, 4, optional: true, type: :sint32
end
