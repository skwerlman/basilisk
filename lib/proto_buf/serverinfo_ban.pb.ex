defmodule ServerInfo_Ban do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          admin_id: String.t(),
          admin_name: String.t(),
          ban_time: String.t(),
          ban_length: String.t(),
          ban_reason: String.t(),
          visible_reason: String.t()
        }
  defstruct [:admin_id, :admin_name, :ban_time, :ban_length, :ban_reason, :visible_reason]

  field :admin_id, 1, required: true, type: :string
  field :admin_name, 2, required: true, type: :string
  field :ban_time, 3, required: true, type: :string
  field :ban_length, 4, required: true, type: :string
  field :ban_reason, 5, optional: true, type: :string
  field :visible_reason, 6, optional: true, type: :string
end
