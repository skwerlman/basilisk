defmodule Event_NotifyUser do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: integer,
          warning_reason: String.t(),
          custom_title: String.t(),
          custom_content: String.t()
        }
  defstruct [:type, :warning_reason, :custom_title, :custom_content]

  field :type, 1, optional: true, type: Event_NotifyUser.NotificationType, enum: true
  field :warning_reason, 2, optional: true, type: :string
  field :custom_title, 3, optional: true, type: :string
  field :custom_content, 4, optional: true, type: :string
end

defmodule Event_NotifyUser.NotificationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :UNKNOWN, 0
  field :PROMOTED, 1
  field :WARNING, 2
  field :IDLEWARNING, 3
  field :CUSTOM, 4
end
