require 'swagger_helper'

RSpec.describe 'v1/user', type: :request do

  path '/v1/login' do

    post('auth user') do
      consumes 'application/json'
      parameter name: :email, in: :body, type: :string, required: true
      parameter name: :password, in: :body, type: :string, required: true
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/v1/me' do

    get('me user') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/v1' do

    parameter name: :email, in: :body, type: :string, required: true
    parameter name: :password, in: :body, type: :string, required: true
    parameter name: :name, in: :body, type: :string, required: true
    post('register user') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
