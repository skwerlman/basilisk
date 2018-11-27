defmodule Event_CreateArrow do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          arrow_info: ServerInfo_Arrow.t() | nil
        }
  defstruct [:arrow_info]

  field :arrow_info, 1, optional: true, type: ServerInfo_Arrow
end
