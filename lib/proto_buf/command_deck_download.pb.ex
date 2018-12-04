defmodule Command_DeckDownload do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          deck_id: integer
        }
  defstruct [:deck_id]

  field(:deck_id, 1, optional: true, type: :sint32, default: -1)
end
