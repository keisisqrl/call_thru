defmodule CallThru.Fabric.Line do
  use Ecto.Schema
  import Ecto.Changeset
  alias CallThru.Fabric.Line


  schema "lines" do
    field :number, :string
    field :switch_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Line{} = line, attrs) do
    line
    |> cast(attrs, [:number])
    |> validate_required([:number])
  end
end
