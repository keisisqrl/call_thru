defmodule CallThru.Driver.Call do
  use Ecto.Schema
  import Ecto.Changeset
  alias CallThru.Driver.Call
  alias CallThru.Fabric.Line
  alias CallThru.Repo


  schema "calls" do
    field :origin, :string
    field :term, :string

    field :success, :boolean, default: false

    field :finish, :naive_datetime

    has_one :origin_line, Line, foreign_key: :call_id, on_replace: :nilify
    has_one :term_line, Line, foreign_key: :call_id, on_replace: :nilify

    timestamps()
  end

  @doc false
  def changeset(%Call{} = call, attrs) do
    call
    |> Repo.preload([:origin_line,:term_line])
    |> cast(attrs, [:origin,:term,:success])
    |> (fn change ->
      case get_change(change,:success) do
        true ->
          put_change(change,:finish,NaiveDateTime.utc_now)
        _ ->
          change
      end
    end).()
    |> put_assoc(:origin_line,attrs[:origin_line])
    |> cast_assoc(:term_line)
    |> validate_required([])
  end
end
