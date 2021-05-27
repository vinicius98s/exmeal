defmodule Exmeal.Users.Get do
  alias Exmeal.{Repo, Error, User}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user -> {:ok, user}
    end
  end
end
