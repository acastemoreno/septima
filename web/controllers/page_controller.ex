defmodule Septima.PageController do
  use Septima.Web, :controller
  use Guardian.Phoenix.Controller

  def index(conn, _params, userlog, _claims) do
    render conn, "index.html", userlog: userlog
  end

  def logout(conn, _params, _userlog, _claims) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
