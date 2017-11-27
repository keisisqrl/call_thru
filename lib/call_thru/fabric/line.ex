defmodule CallThru.Fabric.Line do
  use Ecto.Schema
  import Ecto.Changeset
  alias CallThru.Fabric.{Line, Switch}


  schema "lines" do
    field :number, :string
    field :switch_id, :id

    belongs_to :switch, Switch, define_field: false

    timestamps()
  end

  @doc false
  def changeset(%Line{} = line, attrs) do
    line
    |> cast(attrs, [:number,:switch_id])
    |> validate_required([:number])
    |> unique_constraint([:number,:switch_id], name: :lines_number_switch_id_index)
  end
end
