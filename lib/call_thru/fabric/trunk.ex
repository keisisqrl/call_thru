defmodule CallThru.Fabric.Trunk do
  use Ecto.Schema
  import Ecto.Changeset
  alias CallThru.Fabric.{Trunk, Switch}


  schema "trunks" do
    belongs_to :origin, Switch
    belongs_to :term, Switch

    timestamps()
  end

  @doc false
  def changeset(%Trunk{} = trunk, attrs) do
    trunk
    |> cast(attrs, [:origin_id, :term_id])
    |> validate_required([:origin_id, :term_id])
  end
end
