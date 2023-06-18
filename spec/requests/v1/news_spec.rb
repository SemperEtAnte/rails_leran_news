require 'swagger_helper'

RSpec.describe 'v1/news', type: :request do

  path '/v1' do

    post('create news') do
      consumes 'multipart/form-data'
      produces 'application/json'
      parameter name: :main_text, in: :body, type: :string, required: true
      parameter name: :short_text, in: :body, type: :string, required: true
      parameter name: :image, in: :body, type: :string
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

    patch('edit news') do
      consumes 'multipart/form-data'
      produces 'application/json'
      parameter name: :main_text, in: :body, type: :string
      parameter name: :short_text, in: :body, type: :string
      parameter name: :image, in: :body, type: :string
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

    get('list news') do
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

  path '/v1/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('info news') do
      response(200, 'successful') do
        let(:id) { '123' }

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
