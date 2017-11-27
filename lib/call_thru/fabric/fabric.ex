defmodule CallThru.Fabric do
  @moduledoc """
  The Fabric context.
  """

  import Ecto.Query, warn: false
  alias CallThru.Repo

  alias CallThru.Fabric.Switch

  @doc """
  Returns the list of switches.

  ## Examples

      iex> list_switches()
      [%Switch{}, ...]

  """
  def list_switches do
    Repo.all(Switch)
  end

  @doc """
  Gets a single switch.

  Raises `Ecto.NoResultsError` if the Switch does not exist.

  ## Examples

      iex> get_switch!(123)
      %Switch{}

      iex> get_switch!(456)
      ** (Ecto.NoResultsError)

  """
  def get_switch!(id), do: Repo.get!(Switch, id)

  @doc """
  Creates a switch.

  ## Examples

      iex> create_switch(%{field: value})
      {:ok, %Switch{}}

      iex> create_switch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_switch(attrs \\ %{}) do
    %Switch{}
    |> Switch.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a switch.

  ## Examples

      iex> update_switch(switch, %{field: new_value})
      {:ok, %Switch{}}

      iex> update_switch(switch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_switch(%Switch{} = switch, attrs) do
    switch
    |> Switch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Switch.

  ## Examples

      iex> delete_switch(switch)
      {:ok, %Switch{}}

      iex> delete_switch(switch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_switch(%Switch{} = switch) do
    Repo.delete(switch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking switch changes.

  ## Examples

      iex> change_switch(switch)
      %Ecto.Changeset{source: %Switch{}}

  """
  def change_switch(%Switch{} = switch) do
    Switch.changeset(switch, %{})
  end
end
