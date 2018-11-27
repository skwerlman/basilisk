defmodule IslMessage do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          message_type: integer,
          session_id: non_neg_integer,
          player_id: integer,
          game_command: CommandContainer.t() | nil,
          room_command: CommandContainer.t() | nil,
          response: Response.t() | nil,
          session_event: SessionEvent.t() | nil,
          game_event_container: GameEventContainer.t() | nil,
          room_event: RoomEvent.t() | nil
        }
  defstruct [
    :message_type,
    :session_id,
    :player_id,
    :game_command,
    :room_command,
    :response,
    :session_event,
    :game_event_container,
    :room_event
  ]

  field :message_type, 1, optional: true, type: IslMessage.MessageType, enum: true
  field :session_id, 9, optional: true, type: :uint64
  field :player_id, 10, optional: true, type: :sint32, default: -1
  field :game_command, 100, optional: true, type: CommandContainer
  field :room_command, 101, optional: true, type: CommandContainer
  field :response, 200, optional: true, type: Response
  field :session_event, 201, optional: true, type: SessionEvent
  field :game_event_container, 202, optional: true, type: GameEventContainer
  field :room_event, 203, optional: true, type: RoomEvent
end

defmodule IslMessage.MessageType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :GAME_COMMAND_CONTAINER, 0
  field :ROOM_COMMAND_CONTAINER, 1
  field :RESPONSE, 10
  field :SESSION_EVENT, 11
  field :GAME_EVENT_CONTAINER, 12
  field :ROOM_EVENT, 13
end
