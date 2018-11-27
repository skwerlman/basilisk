defmodule Response_WarnHistory do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          warn_list: [ServerInfo_Warning.t()]
        }
  defstruct [:warn_list]

  field :warn_list, 1, repeated: true, type: ServerInfo_Warning
end
