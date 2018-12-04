defmodule Response_DeckDownload do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          deck: String.t()
        }
  defstruct [:deck]

  field(:deck, 1, optional: true, type: :string)
end
