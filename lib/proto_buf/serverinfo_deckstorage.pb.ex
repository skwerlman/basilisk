defmodule ServerInfo_DeckStorage_File do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          creation_time: non_neg_integer
        }
  defstruct [:creation_time]

  field :creation_time, 1, optional: true, type: :uint32
end

defmodule ServerInfo_DeckStorage_Folder do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          items: [ServerInfo_DeckStorage_TreeItem.t()]
        }
  defstruct [:items]

  field :items, 1, repeated: true, type: ServerInfo_DeckStorage_TreeItem
end

defmodule ServerInfo_DeckStorage_TreeItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          id: non_neg_integer,
          name: String.t(),
          file: ServerInfo_DeckStorage_File.t() | nil,
          folder: ServerInfo_DeckStorage_Folder.t() | nil
        }
  defstruct [:id, :name, :file, :folder]

  field :id, 1, optional: true, type: :uint32
  field :name, 2, optional: true, type: :string
  field :file, 10, optional: true, type: ServerInfo_DeckStorage_File
  field :folder, 11, optional: true, type: ServerInfo_DeckStorage_Folder
end
