defmodule ElaApi.Facts do
  @moduledoc """
  The Facts context.
  """

  import Ecto.Query, warn: false
  alias ElaApi.Repo

  alias ElaApi.Facts.Fact

  @doc """
  Returns the list of facts.

  ## Examples

      iex> list_facts()
      [%Fact{}, ...]

  """
  def list_facts do
    Repo.all(Fact)
  end

  @doc """
  Gets a single fact.

  Raises `Ecto.NoResultsError` if the Fact does not exist.

  ## Examples

      iex> get_fact!(123)
      %Fact{}

      iex> get_fact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fact!(id), do: Repo.get!(Fact, id)

  @doc """
  Creates a fact.

  ## Examples

      iex> create_fact(%{field: value})
      {:ok, %Fact{}}

      iex> create_fact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fact(attrs \\ %{}) do
    %Fact{}
    |> Fact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fact.

  ## Examples

      iex> update_fact(fact, %{field: new_value})
      {:ok, %Fact{}}

      iex> update_fact(fact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fact(%Fact{} = fact, attrs) do
    fact
    |> Fact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Fact.

  ## Examples

      iex> delete_fact(fact)
      {:ok, %Fact{}}

      iex> delete_fact(fact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fact(%Fact{} = fact) do
    Repo.delete(fact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fact changes.

  ## Examples

      iex> change_fact(fact)
      %Ecto.Changeset{source: %Fact{}}

  """
  def change_fact(%Fact{} = fact) do
    Fact.changeset(fact, %{})
  end
end
