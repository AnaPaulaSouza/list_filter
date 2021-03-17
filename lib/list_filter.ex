defmodule ListFilter do
  require Integer

  @doc """
    iex> ListFilter.call(["1", "3", "6", "43", "9", "banana", "6", "abc", "7"])
    5

    iex> ListFilter.call(["6", "banana", "6", "abc"])
    0
  """
  def call(list), do:
    list
    |> Enum.flat_map(&list_filter/1)
    |> Enum.count()

  def find_odd(elem) do
    case Integer.is_odd(elem) do
      true -> [elem]
      false -> []
    end
  end

  defp list_filter(elem) do
    case Integer.parse(elem) do
      {int, _rest} -> find_odd(int)
      :error -> []
    end
  end
end