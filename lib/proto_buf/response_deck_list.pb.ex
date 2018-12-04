defmodule Response_DeckList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          root: ServerInfo_DeckStorage_Folder.t() | nil
        }
  defstruct [:root]

  field(:root, 1, optional: true, type: ServerInfo_DeckStorage_Folder)
end
