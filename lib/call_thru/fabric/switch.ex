defmodule CallThru.Fabric.Switch do
  use Ecto.Schema
  import Ecto.Changeset
  alias CallThru.Repo
  alias CallThru.Fabric.{Switch, Line, Trunk}


  schema "switches" do
    field :name, :string
    field :prefix, :string

    has_many :lines, Line, foreign_key: :switch_id
    many_to_many :term_switches, Switch, join_through: Trunk, join_keys: [origin_id: :id, term_id: :id]

    timestamps()
  end

  @doc false
  def changeset(%Switch{} = switch, attrs) do
    switch
    |> Repo.preload(:term_switches)
    |> cast(attrs, [:name, :prefix])
    |> validate_required([:name, :prefix])
    |> unique_constraint(:name)
    |> unique_constraint(:prefix)
    |> put_assoc(:term_switches, attrs[:term_switches])
  end
end
