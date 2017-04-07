defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_default) do
  end

  def call(conn, _default) do
    user_id = get_session(conn, :user_id)
    cond do
      user_id ->
        user = user_id && Repo.get(User, user_id)
        assign(conn, :user, user) # It will return user as conn.assigns.user
      true ->
        assign(conn, :user, nil)
    end
  end
end
