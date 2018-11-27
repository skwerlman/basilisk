defmodule AdminCommand do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule AdminCommand.AdminCommandType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :UPDATE_SERVER_MESSAGE, 1000
  field :SHUTDOWN_SERVER, 1001
  field :RELOAD_CONFIG, 1002
  field :ADJUST_MOD, 1003
end

defmodule Command_UpdateServerMessage do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Command_ShutdownServer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          reason: String.t(),
          minutes: non_neg_integer
        }
  defstruct [:reason, :minutes]

  field :reason, 1, optional: true, type: :string
  field :minutes, 2, optional: true, type: :uint32
end

defmodule Command_ReloadConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Command_AdjustMod do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          should_be_mod: boolean
        }
  defstruct [:user_name, :should_be_mod]

  field :user_name, 1, required: true, type: :string
  field :should_be_mod, 2, required: true, type: :bool
end
