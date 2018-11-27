defmodule ModeratorCommand do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule ModeratorCommand.ModeratorCommandType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :BAN_FROM_SERVER, 1000
  field :BAN_HISTORY, 1001
  field :WARN_USER, 1002
  field :WARN_HISTORY, 1003
  field :WARN_LIST, 1004
  field :VIEWLOG_HISTORY, 1005
end

defmodule Command_BanFromServer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          address: String.t(),
          minutes: non_neg_integer,
          reason: String.t(),
          visible_reason: String.t(),
          clientid: String.t()
        }
  defstruct [:user_name, :address, :minutes, :reason, :visible_reason, :clientid]

  field :user_name, 1, optional: true, type: :string
  field :address, 2, optional: true, type: :string
  field :minutes, 3, optional: true, type: :uint32
  field :reason, 4, optional: true, type: :string
  field :visible_reason, 5, optional: true, type: :string
  field :clientid, 6, optional: true, type: :string
end

defmodule Command_GetBanHistory do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t()
        }
  defstruct [:user_name]

  field :user_name, 1, optional: true, type: :string
end

defmodule Command_WarnUser do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          reason: String.t(),
          clientid: String.t()
        }
  defstruct [:user_name, :reason, :clientid]

  field :user_name, 1, optional: true, type: :string
  field :reason, 2, optional: true, type: :string
  field :clientid, 3, optional: true, type: :string
end

defmodule Command_GetWarnHistory do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t()
        }
  defstruct [:user_name]

  field :user_name, 1, optional: true, type: :string
end

defmodule Command_GetWarnList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          mod_name: String.t(),
          user_name: String.t(),
          user_clientid: String.t()
        }
  defstruct [:mod_name, :user_name, :user_clientid]

  field :mod_name, 1, optional: true, type: :string
  field :user_name, 2, optional: true, type: :string
  field :user_clientid, 3, optional: true, type: :string
end

defmodule Command_ViewLogHistory do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          ip_address: String.t(),
          game_name: String.t(),
          game_id: String.t(),
          message: String.t(),
          log_location: [String.t()],
          date_range: non_neg_integer,
          maximum_results: non_neg_integer
        }
  defstruct [
    :user_name,
    :ip_address,
    :game_name,
    :game_id,
    :message,
    :log_location,
    :date_range,
    :maximum_results
  ]

  field :user_name, 1, optional: true, type: :string
  field :ip_address, 2, optional: true, type: :string
  field :game_name, 3, optional: true, type: :string
  field :game_id, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
  field :log_location, 6, repeated: true, type: :string
  field :date_range, 7, required: true, type: :uint32
  field :maximum_results, 8, optional: true, type: :uint32
end
