defmodule Response_DumpZone do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          zone_info: ServerInfo_Zone.t() | nil
        }
  defstruct [:zone_info]

  field(:zone_info, 1, optional: true, type: ServerInfo_Zone)
end
