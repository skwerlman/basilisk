defmodule Command_DeckSelect do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          deck: String.t(),
          deck_id: integer
        }
  defstruct [:deck, :deck_id]

  field(:deck, 1, optional: true, type: :string)
  field(:deck_id, 2, optional: true, type: :sint32, default: -1)
end
