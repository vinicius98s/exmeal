defmodule Exmeal.Meals.Create do
  alias Ecto.Changeset
  alias Exmeal.{Repo, Meal, Error}

  def call(params) do
    with %Changeset{valid?: true} = changeset <- Meal.changeset(params),
         {:ok, %Meal{}} = result <- Repo.insert(changeset) do
      result
    else
      error -> {:error, Error.build(:bad_request, error)}
    end
  end
end
