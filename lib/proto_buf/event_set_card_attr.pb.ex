defmodule Event_SetCardAttr do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_name: String.t(),
          card_id: integer,
          attribute: integer,
          attr_value: String.t()
        }
  defstruct [:zone_name, :card_id, :attribute, :attr_value]

  field :zone_name, 1, optional: true, type: :string
  field :card_id, 2, optional: true, type: :sint32
  field :attribute, 3, optional: true, type: CardAttribute, enum: true
  field :attr_value, 4, optional: true, type: :string
end
