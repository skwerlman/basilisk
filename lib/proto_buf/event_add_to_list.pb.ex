defmodule Event_AddToList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          list_name: String.t(),
          user_info: ServerInfo_User.t() | nil
        }
  defstruct [:list_name, :user_info]

  field :list_name, 1, optional: true, type: :string
  field :user_info, 2, optional: true, type: ServerInfo_User
end
