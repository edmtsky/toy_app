defmodule ToyApp.Posts.Micropost do
  use Ecto.Schema
  import Ecto.Changeset
  alias ToyApp.Accounts.User

  schema "microposts" do
    field :content, :string
    # field :user_id, :integer # not needed after adding the belongs_to :user
    # microposts belongs to a user (A user has_many microposts)
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(micropost, attrs) do
    micropost
    |> cast(attrs, [:content, :user_id])
    |> validate_required([:content, :user_id])
    |> validate_length(:content, max: 280)    # micro
  end
end
