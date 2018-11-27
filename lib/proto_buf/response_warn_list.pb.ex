defmodule Response_WarnList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          warning: [String.t()],
          user_name: String.t(),
          user_clientid: String.t()
        }
  defstruct [:warning, :user_name, :user_clientid]

  field :warning, 1, repeated: true, type: :string
  field :user_name, 2, optional: true, type: :string
  field :user_clientid, 3, optional: true, type: :string
end
