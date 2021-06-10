defmodule Newsfeed.Repo do
  use Ecto.Repo,
    otp_app: :newsfeed,
    adapter: Ecto.Adapters.Postgres
end
