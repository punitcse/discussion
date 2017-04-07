defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Router.Helpers

  def init(_default) do
  end

  def call(conn, _default) do
    if conn.assigns.user do
      conn
    else
      conn
      |> put_flash(:error, "You need to be sign in to see this page")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end
  end
end
