defmodule Newsfeed.Consumer do

  def handle_message(%{key: key, value: value} = message) do
    IO.inspect(message)
    IO.puts("#{key}: #{value}")
    :ok
  end

end