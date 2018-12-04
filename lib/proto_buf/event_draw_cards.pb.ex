defmodule Event_DrawCards do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          number: integer,
          cards: [ServerInfo_Card.t()]
        }
  defstruct [:number, :cards]

  field(:number, 1, optional: true, type: :sint32)
  field(:cards, 2, repeated: true, type: ServerInfo_Card)
end
