defmodule Response_ForgotPasswordRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          challenge_email: boolean
        }
  defstruct [:challenge_email]

  field :challenge_email, 1, optional: true, type: :bool
end
