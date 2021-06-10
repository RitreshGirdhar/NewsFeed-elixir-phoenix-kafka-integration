defmodule NewsfeedWeb.FeedController do
  use NewsfeedWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

end