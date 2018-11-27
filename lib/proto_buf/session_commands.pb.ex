defmodule SessionCommand do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule SessionCommand.SessionCommandType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  field :PING, 1000
  field :LOGIN, 1001
  field :MESSAGE, 1002
  field :LIST_USERS, 1003
  field :GET_GAMES_OF_USER, 1004
  field :GET_USER_INFO, 1005
  field :ADD_TO_LIST, 1006
  field :REMOVE_FROM_LIST, 1007
  field :DECK_LIST, 1008
  field :DECK_NEW_DIR, 1009
  field :DECK_DEL_DIR, 1010
  field :DECK_DEL, 1011
  field :DECK_DOWNLOAD, 1012
  field :DECK_UPLOAD, 1013
  field :LIST_ROOMS, 1014
  field :JOIN_ROOM, 1015
  field :REGISTER, 1016
  field :ACTIVATE, 1017
  field :ACCOUNT_EDIT, 1018
  field :ACCOUNT_IMAGE, 1019
  field :ACCOUNT_PASSWORD, 1020
  field :FORGOT_PASSWORD_REQUEST, 1021
  field :FORGOT_PASSWORD_RESET, 1022
  field :FORGOT_PASSWORD_CHALLENGE, 1023
  field :REPLAY_LIST, 1100
  field :REPLAY_DOWNLOAD, 1101
  field :REPLAY_MODIFY_MATCH, 1102
  field :REPLAY_DELETE_MATCH, 1103
end

defmodule Command_Ping do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Command_Login do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          password: String.t(),
          clientid: String.t(),
          clientver: String.t(),
          clientfeatures: [String.t()]
        }
  defstruct [:user_name, :password, :clientid, :clientver, :clientfeatures]

  field :user_name, 1, optional: true, type: :string
  field :password, 2, optional: true, type: :string
  field :clientid, 3, optional: true, type: :string
  field :clientver, 4, optional: true, type: :string
  field :clientfeatures, 5, repeated: true, type: :string
end

defmodule Command_Message do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          message: String.t()
        }
  defstruct [:user_name, :message]

  field :user_name, 1, optional: true, type: :string
  field :message, 2, optional: true, type: :string
end

defmodule Command_ListUsers do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Command_GetGamesOfUser do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t()
        }
  defstruct [:user_name]

  field :user_name, 1, optional: true, type: :string
end

defmodule Command_GetUserInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t()
        }
  defstruct [:user_name]

  field :user_name, 1, optional: true, type: :string
end

defmodule Command_AddToList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          list: String.t(),
          user_name: String.t()
        }
  defstruct [:list, :user_name]

  field :list, 1, optional: true, type: :string
  field :user_name, 2, optional: true, type: :string
end

defmodule Command_RemoveFromList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          list: String.t(),
          user_name: String.t()
        }
  defstruct [:list, :user_name]

  field :list, 1, optional: true, type: :string
  field :user_name, 2, optional: true, type: :string
end

defmodule Command_ListRooms do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Command_JoinRoom do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          room_id: non_neg_integer
        }
  defstruct [:room_id]

  field :room_id, 1, optional: true, type: :uint32
end

defmodule Command_Register do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          password: String.t(),
          email: String.t(),
          gender: integer,
          country: String.t(),
          real_name: String.t(),
          clientid: String.t()
        }
  defstruct [:user_name, :password, :email, :gender, :country, :real_name, :clientid]

  field :user_name, 1, required: true, type: :string
  field :password, 2, required: true, type: :string
  field :email, 3, optional: true, type: :string
  field :gender, 4, optional: true, type: ServerInfo_User.Gender, enum: true
  field :country, 5, optional: true, type: :string
  field :real_name, 6, optional: true, type: :string
  field :clientid, 7, optional: true, type: :string
end

defmodule Command_Activate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          token: String.t(),
          clientid: String.t()
        }
  defstruct [:user_name, :token, :clientid]

  field :user_name, 1, required: true, type: :string
  field :token, 2, required: true, type: :string
  field :clientid, 3, optional: true, type: :string
end

defmodule Command_AccountEdit do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          real_name: String.t(),
          email: String.t(),
          gender: integer,
          country: String.t()
        }
  defstruct [:real_name, :email, :gender, :country]

  field :real_name, 1, optional: true, type: :string
  field :email, 2, optional: true, type: :string
  field :gender, 3, optional: true, type: ServerInfo_User.Gender, enum: true
  field :country, 4, optional: true, type: :string
end

defmodule Command_AccountImage do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          image: String.t()
        }
  defstruct [:image]

  field :image, 1, optional: true, type: :bytes
end

defmodule Command_AccountPassword do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          old_password: String.t(),
          new_password: String.t()
        }
  defstruct [:old_password, :new_password]

  field :old_password, 1, optional: true, type: :string
  field :new_password, 2, optional: true, type: :string
end

defmodule Command_ForgotPasswordRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          clientid: String.t()
        }
  defstruct [:user_name, :clientid]

  field :user_name, 1, required: true, type: :string
  field :clientid, 2, optional: true, type: :string
end

defmodule Command_ForgotPasswordReset do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          clientid: String.t(),
          token: String.t(),
          new_password: String.t()
        }
  defstruct [:user_name, :clientid, :token, :new_password]

  field :user_name, 1, required: true, type: :string
  field :clientid, 2, optional: true, type: :string
  field :token, 3, optional: true, type: :string
  field :new_password, 4, optional: true, type: :string
end

defmodule Command_ForgotPasswordChallenge do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user_name: String.t(),
          clientid: String.t(),
          email: String.t()
        }
  defstruct [:user_name, :clientid, :email]

  field :user_name, 1, required: true, type: :string
  field :clientid, 2, optional: true, type: :string
  field :email, 3, optional: true, type: :string
end
