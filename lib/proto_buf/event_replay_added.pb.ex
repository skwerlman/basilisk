defmodule Event_ReplayAdded do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          match_info: ServerInfo_ReplayMatch.t() | nil
        }
  defstruct [:match_info]

  field :match_info, 1, optional: true, type: ServerInfo_ReplayMatch
end
