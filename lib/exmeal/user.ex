defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :cpf, :email]

  @derive {Jason.Encoder, only: [:id] ++ @required_params}

  schema "users" do
    field(:name, :string)
    field(:cpf, :string)
    field(:email, :string)

    has_many(:meals, Meal)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, min: 11, max: 11)
    |> validate_format(:email, ~r/@/)
  end
end
