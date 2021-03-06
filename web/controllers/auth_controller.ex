defmodule Septima.AuthController do
  use Septima.Web, :controller
  plug Ueberauth
  alias Septima.User
  alias Septima.UserFromAuth

  def request(conn, _params) do
    text conn, "Holi, no debo aparecer"
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Fallo en la authenticacion.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case UserFromAuth.get_or_insert(auth, Repo) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user, :token, perms: %{ default: [:read, :write]})
        |> redirect(to: page_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "Fallo en la authenticacion.")
        |> redirect(to: "/")
    end
  end
end
