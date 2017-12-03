defmodule CallThru.Fabric.Line do
  use Ecto.Schema
  import Ecto.Changeset
  alias CallThru.Fabric.{Line, Switch}
  alias CallThru.Driver.Call


  schema "lines" do
    field :number, :string
    field :switch_id, :id
    field :in_use, :boolean, default: false
    field :call_id, :id

    belongs_to :switch, Switch, define_field: false

    has_many :call_origin, Call, foreign_key: :origin_line_id
    has_many :call_term, Call, foreign_key: :term_line_id

    timestamps()
  end

  @doc false
  def changeset(%Line{} = line, attrs) do
    line
    |> cast(attrs, [:number,:switch_id,:in_use])
    |> validate_required([:number])
    |> validate_format(:number,~r/\d+/)
    |> unique_constraint(:number, name: :lines_number_switch_id_index)
  end
end
