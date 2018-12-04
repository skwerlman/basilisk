defmodule ServerInfo_Replay do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replay_id: integer,
          replay_name: String.t(),
          duration: non_neg_integer
        }
  defstruct [:replay_id, :replay_name, :duration]

  field(:replay_id, 1, optional: true, type: :sint32, default: -1)
  field(:replay_name, 2, optional: true, type: :string)
  field(:duration, 3, optional: true, type: :uint32)
end
