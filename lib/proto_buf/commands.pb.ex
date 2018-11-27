defmodule CommandContainer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          cmd_id: non_neg_integer,
          game_id: non_neg_integer,
          room_id: non_neg_integer,
          session_command: [SessionCommand.t()],
          game_command: [GameCommand.t()],
          room_command: [RoomCommand.t()],
          moderator_command: [ModeratorCommand.t()],
          admin_command: [AdminCommand.t()]
        }
  defstruct [
    :cmd_id,
    :game_id,
    :room_id,
    :session_command,
    :game_command,
    :room_command,
    :moderator_command,
    :admin_command
  ]

  field :cmd_id, 1, optional: true, type: :uint64
  field :game_id, 10, optional: true, type: :uint32
  field :room_id, 20, optional: true, type: :uint32
  field :session_command, 100, repeated: true, type: SessionCommand
  field :game_command, 101, repeated: true, type: GameCommand
  field :room_command, 102, repeated: true, type: RoomCommand
  field :moderator_command, 103, repeated: true, type: ModeratorCommand
  field :admin_command, 104, repeated: true, type: AdminCommand
end
