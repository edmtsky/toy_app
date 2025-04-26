defmodule ToyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ToyApp.Posts.Micropost

  schema "users" do
    field :email, :string
    field :name, :string
    # A user has_many microposts
    has_many :microposts, Micropost

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
