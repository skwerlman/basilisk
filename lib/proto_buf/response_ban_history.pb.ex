defmodule Response_BanHistory do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ban_list: [ServerInfo_Ban.t()]
        }
  defstruct [:ban_list]

  field(:ban_list, 1, repeated: true, type: ServerInfo_Ban)
end
