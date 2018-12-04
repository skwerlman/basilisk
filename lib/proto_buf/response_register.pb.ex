defmodule Response_Register do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          denied_reason_str: String.t(),
          denied_end_time: non_neg_integer
        }
  defstruct [:denied_reason_str, :denied_end_time]

  field(:denied_reason_str, 1, optional: true, type: :string)
  field(:denied_end_time, 2, optional: true, type: :uint64)
end
