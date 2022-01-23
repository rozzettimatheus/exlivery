defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Rua teste, 123", "Gabriel", "gabriel@email.com", "12345678900", 26)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "With invalid params, returns an error" do
      response = User.build("Address", "Cleber", "email", "12345", 15)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
