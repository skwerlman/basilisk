defmodule ServerMessage do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          message_type: integer,
          response: Response.t() | nil,
          session_event: SessionEvent.t() | nil,
          game_event_container: GameEventContainer.t() | nil,
          room_event: RoomEvent.t() | nil
        }
  defstruct [:message_type, :response, :session_event, :game_event_container, :room_event]

  field :message_type, 1, optional: true, type: ServerMessage.MessageType, enum: true
  field :response, 2, optional: true, type: Response
  field :session_event, 3, optional: true, type: SessionEvent
  field :game_event_container, 4, optional: true, type: GameEventContainer
  field :room_event, 5, optional: true, type: RoomEvent
end

defmodule ServerMessage.MessageType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :RESPONSE, 0
  field :SESSION_EVENT, 1
  field :GAME_EVENT_CONTAINER, 2
  field :ROOM_EVENT, 3
end
