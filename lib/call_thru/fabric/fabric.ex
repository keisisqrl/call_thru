defmodule CallThru.Fabric do
  @moduledoc """
  The Fabric context.
  """

  import Ecto.Query, warn: false
  alias CallThru.Repo

  alias CallThru.Fabric.{Switch,Line}

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

  def get_switch_by_prefix(prefix), do: Repo.get_by(Switch, prefix: prefix)
  

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

  @doc """
  Returns the list of lines.

  ## Examples

      iex> list_lines()
      [%Line{}, ...]

  """
  def list_lines do
    Repo.all(Line)
    |> Enum.map(&Repo.preload(&1,:switch))
  end

  @doc """
  Gets a single line.

  Raises `Ecto.NoResultsError` if the Line does not exist.

  ## Examples

      iex> get_line!(123)
      %Line{}

      iex> get_line!(456)
      ** (Ecto.NoResultsError)

  """
  def get_line!(id), do: Repo.get!(Line, id) |> Repo.preload(:switch)

  @doc """
  Creates a line.

  ## Examples

      iex> create_line(%{field: value})
      {:ok, %Line{}}

      iex> create_line(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_line(attrs) do
    %Line{}
    |> Line.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a line.

  ## Examples

      iex> update_line(line, %{field: new_value})
      {:ok, %Line{}}

      iex> update_line(line, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_line(line, attrs) do
    line
    |> Line.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Line.

  ## Examples

      iex> delete_line(line)
      {:ok, %Line{}}

      iex> delete_line(line)
      {:error, %Ecto.Changeset{}}

  """
  def delete_line(%Line{} = line) do
    Repo.delete(line)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking line changes.

  ## Examples

      iex> change_line(line)
      %Ecto.Changeset{source: %Line{}}

  """
  def change_line(%Line{} = line) do
    Line.changeset(line, %{})
  end

  def get_lines_for_switch(id) do
    id
    |> get_switch!
    |> Repo.preload(:lines)
    |> (fn switch -> switch.lines end).()
  end
  
end
