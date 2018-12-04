defmodule GameCommand do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule GameCommand.GameCommandType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field(:KICK_FROM_GAME, 1000)
  field(:LEAVE_GAME, 1001)
  field(:GAME_SAY, 1002)
  field(:SHUFFLE, 1003)
  field(:MULLIGAN, 1004)
  field(:ROLL_DIE, 1005)
  field(:DRAW_CARDS, 1006)
  field(:UNDO_DRAW, 1007)
  field(:FLIP_CARD, 1008)
  field(:ATTACH_CARD, 1009)
  field(:CREATE_TOKEN, 1010)
  field(:CREATE_ARROW, 1011)
  field(:DELETE_ARROW, 1012)
  field(:SET_CARD_ATTR, 1013)
  field(:SET_CARD_COUNTER, 1014)
  field(:INC_CARD_COUNTER, 1015)
  field(:READY_START, 1016)
  field(:CONCEDE, 1017)
  field(:INC_COUNTER, 1018)
  field(:CREATE_COUNTER, 1019)
  field(:SET_COUNTER, 1020)
  field(:DEL_COUNTER, 1021)
  field(:NEXT_TURN, 1022)
  field(:SET_ACTIVE_PHASE, 1023)
  field(:DUMP_ZONE, 1024)
  field(:STOP_DUMP_ZONE, 1025)
  field(:REVEAL_CARDS, 1026)
  field(:MOVE_CARD, 1027)
  field(:SET_SIDEBOARD_PLAN, 1028)
  field(:DECK_SELECT, 1029)
  field(:SET_SIDEBOARD_LOCK, 1030)
  field(:CHANGE_ZONE_PROPERTIES, 1031)
end
