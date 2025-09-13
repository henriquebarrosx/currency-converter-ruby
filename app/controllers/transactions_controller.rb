class TransactionsController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :render_missing_param

    def index
    end

    def create
        @transaction = Transaction.new(transaction_params)
        render :json => nil, status: :ok
    end

    private

    def transaction_params
        transaction = params.require(:transaction)

        transaction.require(:user_id)
        transaction.require(:currency_from)
        transaction.require(:currency_to)
        transaction.require(:value_from)

        transaction.permit(:user_id, :currency_from, :currency_to, :value_from)
    end

    def render_missing_param(exception)
        render json: { errors: [exception.message] }, status: :bad_request
    end
end
