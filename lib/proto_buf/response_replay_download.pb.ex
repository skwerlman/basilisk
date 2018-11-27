defmodule Response_ReplayDownload do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replay_data: String.t()
        }
  defstruct [:replay_data]

  field :replay_data, 1, optional: true, type: :bytes
end
