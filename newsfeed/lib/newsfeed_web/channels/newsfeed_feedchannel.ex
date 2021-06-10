defmodule NewsfeedWeb.FeedChannel do
  use NewsfeedWeb, :channel


  def join("news:" <> id, _params, socket) do
    IO.puts(id)
    IO.puts("+++++")
    {:ok, %{ },socket}
  end

  def handle_in(name, %{} , socket) do
    {:ok, %{} }
  end

end