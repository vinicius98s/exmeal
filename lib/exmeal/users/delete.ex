defmodule Exmeal.Users.Delete do
  alias Exmeal.{Repo, Error, User}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user -> Repo.delete(user)
    end
  end
end
