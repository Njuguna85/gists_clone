defmodule ElixirGist.Gists.Gist do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirGist.Comments.Comment
  alias ElixirGist.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "gists" do
    field :description, :string
    field :markup_text, :string
    field :name, :string

    belongs_to :user, User
    has_many :comments, Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(gist, attrs) do
    gist
    |> cast(attrs, [:name, :markup_text, :description, :user_id])
    |> validate_required([:name, :markup_text, :description, :user_id])
  end
end
