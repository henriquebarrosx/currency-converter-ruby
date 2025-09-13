require "test_helper"

class TransactionTest < ActiveSupport::TestCase
    test "should be valid when converted currency be BRL" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "USD",
            currency_to: "BRL",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert transaction.valid?
    end

    test "should be valid when converted currency be USD" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "BRL",
            currency_to: "USD",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert transaction.valid?
    end

    test "should be valid when converted currency be EUR" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "BRL",
            currency_to: "EUR",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert transaction.valid?
    end

    test "should be valid when converted currency be JYP" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "BRL",
            currency_to: "EUR",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert transaction.valid?
    end

    test "should not be valid when converted currency be different of BRL, USD, EUR or JYP" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "BRL",
            currency_to: "ABC",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert_not transaction.valid?
        assert_includes transaction.errors[:currency_to], "ABC is not a valid currency"
    end

    test "should be valid when currency to be converted be BRL" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "BRL",
            currency_to: "USD",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert transaction.valid?
    end

    test "should be valid when currency to be converted be USD" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "USD",
            currency_to: "BRL",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert transaction.valid?
    end

    test "should be valid when currency to be converted be EUR" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "EUR",
            currency_to: "BRL",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert transaction.valid?
    end

    test "should be valid when currency to be converted be JYP" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "JYP",
            currency_to: "BRL",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert transaction.valid?
    end

    test "should not be valid when currency to be converted be different of BRL, USD, EUR or JYP" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "ABC",
            currency_to: "BRL",
            value_from: 100,
            value_to: 500,
            rate: 5
        )

        assert_not transaction.valid?
        assert_includes transaction.errors[:currency_from], "ABC is not a valid currency"
    end

    test "should not be valid when value to be converted be less than or equal 0" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "ABC",
            currency_to: "BRL",
            value_from: 0,
            value_to: 500,
            rate: 5
        )

        assert_not transaction.valid?
        assert_includes transaction.errors[:value_from], "must to be greater than 0"
    end

    test "should not be valid when converted value be less than or equal 0" do
        transaction = Transaction.new(
            user_id: 1,
            currency_from: "ABC",
            currency_to: "BRL",
            value_from: 10,
            value_to: 0,
            rate: 5
        )

        assert_not transaction.valid?
        assert_includes transaction.errors[:value_to], "must to be greater than 0"
    end
end
