defmodule ElaApi.Facts.Fact do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElaApi.Facts.Fact


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "facts" do
    field :text, :string
    field :person_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(%Fact{} = fact, attrs) do
    fact
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
