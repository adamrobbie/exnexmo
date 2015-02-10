defmodule ExNexmoTest do
  use ExUnit.Case, async: false

  import Mock

  setup do
    Application.put_env(:ex_nexmo, :key, "xxx")
    Application.put_env(:ex_nexmo, :secret, "xxx")
  end

  test "application should start" do
    {result, _} = ExNexmo.start(:normal, [])
    assert result == :ok
  end

  test "key is configurable" do
    assert ExNexmo.key == "xxx"
  end

  test "secret is configurable" do
    assert ExNexmo.secret == "xxx"
  end

  test "a real live request" do
    response = %{"test" => 1}
    with_mock ExNexmo.Messages, [send: fn(_to, _from, _text) -> response end] do
      ExNexmo.Messages.send("1", "2", "test")
      assert called ExNexmo.Messages.send("1", "2", "test")
    end
  end
end
