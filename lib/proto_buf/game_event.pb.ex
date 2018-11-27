defmodule GameEvent do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          player_id: integer
        }
  defstruct [:player_id]

  field :player_id, 1, optional: true, type: :sint32, default: -1
end

defmodule GameEvent.GameEventType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :JOIN, 1000
  field :LEAVE, 1001
  field :GAME_CLOSED, 1002
  field :GAME_HOST_CHANGED, 1003
  field :KICKED, 1004
  field :GAME_STATE_CHANGED, 1005
  field :PLAYER_PROPERTIES_CHANGED, 1007
  field :GAME_SAY, 1009
  field :CREATE_ARROW, 2000
  field :DELETE_ARROW, 2001
  field :CREATE_COUNTER, 2002
  field :SET_COUNTER, 2003
  field :DEL_COUNTER, 2004
  field :DRAW_CARDS, 2005
  field :REVEAL_CARDS, 2006
  field :SHUFFLE, 2007
  field :ROLL_DIE, 2008
  field :MOVE_CARD, 2009
  field :FLIP_CARD, 2010
  field :DESTROY_CARD, 2011
  field :ATTACH_CARD, 2012
  field :CREATE_TOKEN, 2013
  field :SET_CARD_ATTR, 2014
  field :SET_CARD_COUNTER, 2015
  field :SET_ACTIVE_PLAYER, 2016
  field :SET_ACTIVE_PHASE, 2017
  field :DUMP_ZONE, 2018
  field :STOP_DUMP_ZONE, 2019
  field :CHANGE_ZONE_PROPERTIES, 2020
end
