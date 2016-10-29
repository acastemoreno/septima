defmodule Septima.UserController do
  use Septima.Web, :controller
  use Guardian.Phoenix.Controller

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__
  plug Guardian.Plug.EnsurePermissions, handler: __MODULE__, admin: [:dashboard, :make_payments]

  def index(conn, _params, userlog, _claims) do
    render conn, "index.html", userlog: userlog
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "Logueate pues.")
    |> redirect(to: "/")
  end

  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, "No tienes permiso para users, solo admins")
    |> redirect(to: page_path(conn, :index))
  end
end
