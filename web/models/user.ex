defmodule Discuss.User do
  use Discuss.Web, :model

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topic, Discuss.Topic

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider])
  end
end
