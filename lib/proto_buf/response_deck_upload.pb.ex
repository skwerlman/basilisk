defmodule Response_DeckUpload do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          new_file: ServerInfo_DeckStorage_TreeItem.t() | nil
        }
  defstruct [:new_file]

  field :new_file, 1, optional: true, type: ServerInfo_DeckStorage_TreeItem
end
