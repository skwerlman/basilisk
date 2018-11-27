defmodule Response_Login do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_info: ServerInfo_User.t() | nil,
          buddy_list: [ServerInfo_User.t()],
          ignore_list: [ServerInfo_User.t()],
          denied_reason_str: String.t(),
          denied_end_time: non_neg_integer,
          missing_features: [String.t()]
        }
  defstruct [
    :user_info,
    :buddy_list,
    :ignore_list,
    :denied_reason_str,
    :denied_end_time,
    :missing_features
  ]

  field :user_info, 1, optional: true, type: ServerInfo_User
  field :buddy_list, 2, repeated: true, type: ServerInfo_User
  field :ignore_list, 3, repeated: true, type: ServerInfo_User
  field :denied_reason_str, 4, optional: true, type: :string
  field :denied_end_time, 5, optional: true, type: :uint64
  field :missing_features, 6, repeated: true, type: :string
end
