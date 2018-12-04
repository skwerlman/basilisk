defmodule ServerInfo_Warning do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          admin_name: String.t(),
          reason: String.t(),
          time_of: String.t()
        }
  defstruct [:user_name, :admin_name, :reason, :time_of]

  field(:user_name, 1, optional: true, type: :string)
  field(:admin_name, 2, optional: true, type: :string)
  field(:reason, 3, optional: true, type: :string)
  field(:time_of, 4, optional: true, type: :string)
end
