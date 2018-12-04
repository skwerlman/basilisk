defmodule Response_ReplayList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          match_list: [ServerInfo_ReplayMatch.t()]
        }
  defstruct [:match_list]

  field(:match_list, 1, repeated: true, type: ServerInfo_ReplayMatch)
end
