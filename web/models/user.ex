defmodule Septima.User do
  use Septima.Web, :model

  schema "users" do
    field :nombre, :string
    field :email, :string
    field :is_admin, :boolean, default: false

    has_many :authorizations, Septima.Authorization

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre, :email, :is_admin])
    |> validate_required([:nombre, :email, :is_admin])
  end
end
