defmodule Response_ListUsers do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_list: [ServerInfo_User.t()]
        }
  defstruct [:user_list]

  field(:user_list, 1, repeated: true, type: ServerInfo_User)
end
