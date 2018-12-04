defmodule Command_DeckUpload do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          deck_id: non_neg_integer,
          deck_list: String.t()
        }
  defstruct [:path, :deck_id, :deck_list]

  field(:path, 1, optional: true, type: :string)
  field(:deck_id, 2, optional: true, type: :uint32)
  field(:deck_list, 3, optional: true, type: :string)
end
