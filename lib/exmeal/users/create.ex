defmodule Exmeal.Users.Create do
  alias Ecto.Changeset
  alias Exmeal.{Repo, User, Error}

  def call(params) do
    with %Changeset{valid?: true} = changeset <- User.changeset(params),
         {:ok, %User{}} = result <- Repo.insert(changeset) do
      result
    else
      error -> {:error, Error.build(:bad_request, error)}
    end
  end
end
