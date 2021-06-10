defmodule Consumer do

  def handle_message(%{key: key, value: value} = message) do
    IO.inspect(message)
    IO.puts("#{key}: #{value}")
    NewsfeedWeb.Endpoint.broadcast!("news:latest", "news:latest:new", %{news: value})
    :ok
  end

end