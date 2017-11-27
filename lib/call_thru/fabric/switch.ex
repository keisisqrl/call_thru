defmodule CallThru.Fabric.Switch do
  use Ecto.Schema
  import Ecto.Changeset
  alias CallThru.Fabric.Switch


  schema "switches" do
    field :name, :string
    field :prefix, :string

    timestamps()
  end

  @doc false
  def changeset(%Switch{} = switch, attrs) do
    switch
    |> cast(attrs, [:name, :prefix])
    |> validate_required([:name, :prefix])
    |> unique_constraint(:name)
    |> unique_constraint(:prefix)
  end
end
