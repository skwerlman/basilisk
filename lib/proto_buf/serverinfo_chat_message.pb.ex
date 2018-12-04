defmodule ServerInfo_ChatMessage do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: String.t(),
          sender_id: String.t(),
          sender_name: String.t(),
          sender_ip: String.t(),
          message: String.t(),
          target_type: String.t(),
          target_id: String.t(),
          target_name: String.t()
        }
  defstruct [
    :time,
    :sender_id,
    :sender_name,
    :sender_ip,
    :message,
    :target_type,
    :target_id,
    :target_name
  ]

  field(:time, 1, optional: true, type: :string)
  field(:sender_id, 2, optional: true, type: :string)
  field(:sender_name, 3, optional: true, type: :string)
  field(:sender_ip, 4, optional: true, type: :string)
  field(:message, 5, optional: true, type: :string)
  field(:target_type, 6, optional: true, type: :string)
  field(:target_id, 7, optional: true, type: :string)
  field(:target_name, 8, optional: true, type: :string)
end
