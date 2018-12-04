defmodule Command_SetCardAttr do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone: String.t(),
          card_id: integer,
          attribute: integer,
          attr_value: String.t()
        }
  defstruct [:zone, :card_id, :attribute, :attr_value]

  field(:zone, 1, optional: true, type: :string)
  field(:card_id, 2, optional: true, type: :sint32, default: -1)
  field(:attribute, 3, optional: true, type: CardAttribute, enum: true)
  field(:attr_value, 4, optional: true, type: :string)
end
