defmodule My.Repo do
  use Ecto.Repo,
    otp_app: :my,
    adapter: Ecto.Adapters.Postgres
end
