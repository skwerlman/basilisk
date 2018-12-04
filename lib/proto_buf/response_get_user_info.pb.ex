defmodule Response_GetUserInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_info: ServerInfo_User.t() | nil
        }
  defstruct [:user_info]

  field(:user_info, 1, optional: true, type: ServerInfo_User)
end
