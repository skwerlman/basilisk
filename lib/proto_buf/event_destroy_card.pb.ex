defmodule Event_DestroyCard do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t(),
          card_id: non_neg_integer
        }
  defstruct [:zone_name, :card_id]

  field :zone_name, 1, optional: true, type: :string
  field :card_id, 2, optional: true, type: :uint32
end
