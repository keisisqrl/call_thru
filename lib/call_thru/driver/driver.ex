defmodule CallThru.Driver do
  @moduledoc """
  The Driver context.
  """

  import Ecto.Query, warn: false
  alias CallThru.Repo

  alias CallThru.Driver.Call

  @doc """
  Returns the list of calls.

  ## Examples

      iex> list_calls()
      [%Call{}, ...]

  """
  def list_calls do
    Repo.all(Call)
  end

  @doc """
  Gets a single call.

  Raises `Ecto.NoResultsError` if the Call does not exist.

  ## Examples

      iex> get_call!(123)
      %Call{}

      iex> get_call!(456)
      ** (Ecto.NoResultsError)

  """
  def get_call!(id), do: Repo.get!(Call, id)

  @doc """
  Creates a call.

  ## Examples

      iex> create_call(%{field: value})
      {:ok, %Call{}}

      iex> create_call(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_call(attrs \\ %{}) do
    %Call{}
    |> Call.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a call.

  ## Examples

      iex> update_call(call, %{field: new_value})
      {:ok, %Call{}}

      iex> update_call(call, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_call(%Call{} = call, attrs) do
    call
    |> Call.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Call.

  ## Examples

      iex> delete_call(call)
      {:ok, %Call{}}

      iex> delete_call(call)
      {:error, %Ecto.Changeset{}}

  """
  def delete_call(%Call{} = call) do
    Repo.delete(call)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking call changes.

  ## Examples

      iex> change_call(call)
      %Ecto.Changeset{source: %Call{}}

  """
  def change_call(%Call{} = call) do
    Call.changeset(call, %{})
  end
end
