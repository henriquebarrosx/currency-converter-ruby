require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
    test "should not create transaction without user" do
        invalid_params = {
            transaction: {
                currency_from: "USD",
                currency_to: "BRL",
                value_from: 12
            }
        }

        post transactions_url, params: invalid_params
        assert_response :bad_request

        json_response = JSON.parse(response.body)
        assert_includes json_response["errors"].first,
                        "param is missing or the value is empty or invalid: user_id"
    end

    test "should not create transaction without the currency to be converted" do
        invalid_params = {
            transaction: {
                user_id: 10,
                currency_to: "BRL",
                value_from: 12
            }
        }

        post transactions_url, params: invalid_params
        assert_response :bad_request

        json_response = JSON.parse(response.body)

        assert_includes json_response["errors"].first,
                        "param is missing or the value is empty or invalid: currency_from"
    end

    test "should not create transaction without the converted currency" do
        invalid_params = {
            transaction: {
                user_id: 10,
                currency_from: "BRL",
                value_from: 12
            }
        }

        post transactions_url, params: invalid_params
        assert_response :bad_request

        json_response = JSON.parse(response.body)
        assert_includes json_response["errors"].first,
                        "param is missing or the value is empty or invalid: currency_to"
    end

    test "should not create transaction without the value to be converted" do
        invalid_params = {
            transaction: {
                user_id: 10,
                currency_from: "USD",
                currency_to: "BRL",
            }
        }

        post transactions_url, params: invalid_params
        assert_response :bad_request

        json_response = JSON.parse(response.body)
        assert_includes json_response["errors"].first,
                        "param is missing or the value is empty or invalid: value_from"
    end
end
