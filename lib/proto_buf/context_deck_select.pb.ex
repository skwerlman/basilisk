defmodule Context_DeckSelect do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          deck_hash: String.t(),
          sideboard_size: integer
        }
  defstruct [:deck_hash, :sideboard_size]

  field :deck_hash, 1, optional: true, type: :string
  field :sideboard_size, 2, optional: true, type: :int32, default: -1
end
