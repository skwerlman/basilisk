defmodule Response do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          cmd_id: non_neg_integer,
          response_code: integer
        }
  defstruct [:cmd_id, :response_code]

  field :cmd_id, 1, required: true, type: :uint64
  field :response_code, 2, optional: true, type: Response.ResponseCode, enum: true
end

defmodule Response.ResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :RespNotConnected, -1
  field :RespNothing, 0
  field :RespOk, 1
  field :RespNotInRoom, 2
  field :RespInternalError, 3
  field :RespInvalidCommand, 4
  field :RespInvalidData, 5
  field :RespNameNotFound, 6
  field :RespLoginNeeded, 7
  field :RespFunctionNotAllowed, 8
  field :RespGameNotStarted, 9
  field :RespGameFull, 10
  field :RespContextError, 11
  field :RespWrongPassword, 12
  field :RespSpectatorsNotAllowed, 13
  field :RespOnlyBuddies, 14
  field :RespUserLevelTooLow, 15
  field :RespInIgnoreList, 16
  field :RespWouldOverwriteOldSession, 17
  field :RespChatFlood, 18
  field :RespUserIsBanned, 19
  field :RespAccessDenied, 20
  field :RespUsernameInvalid, 21
  field :RespRegistrationRequired, 22
  field :RespRegistrationAccepted, 23
  field :RespUserAlreadyExists, 24
  field :RespEmailRequiredToRegister, 25
  field :RespTooManyRequests, 26
  field :RespPasswordTooShort, 27
  field :RespAccountNotActivated, 28
  field :RespRegistrationDisabled, 29
  field :RespRegistrationFailed, 30
  field :RespActivationAccepted, 31
  field :RespActivationFailed, 32
  field :RespRegistrationAcceptedNeedsActivation, 33
  field :RespClientIdRequired, 34
  field :RespClientUpdateRequired, 35
  field :RespServerFull, 36
  field :RespEmailBlackListed, 37
end

defmodule Response.ResponseType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :JOIN_ROOM, 1000
  field :LIST_USERS, 1001
  field :GET_GAMES_OF_USER, 1002
  field :GET_USER_INFO, 1003
  field :DUMP_ZONE, 1004
  field :LOGIN, 1005
  field :DECK_LIST, 1006
  field :DECK_DOWNLOAD, 1007
  field :DECK_UPLOAD, 1008
  field :REGISTER, 1009
  field :ACTIVATE, 1010
  field :ADJUST_MOD, 1011
  field :BAN_HISTORY, 1012
  field :WARN_HISTORY, 1013
  field :WARN_LIST, 1014
  field :VIEW_LOG, 1015
  field :FORGOT_PASSWORD_REQUEST, 1016
  field :REPLAY_LIST, 1100
  field :REPLAY_DOWNLOAD, 1101
end
