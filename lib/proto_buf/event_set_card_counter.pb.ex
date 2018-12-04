defmodule Event_SetCardCounter do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t(),
          card_id: integer,
          counter_id: integer,
          counter_value: integer
        }
  defstruct [:zone_name, :card_id, :counter_id, :counter_value]

  field(:zone_name, 1, optional: true, type: :string)
  field(:card_id, 2, optional: true, type: :sint32)
  field(:counter_id, 3, optional: true, type: :sint32)
  field(:counter_value, 4, optional: true, type: :sint32)
end
