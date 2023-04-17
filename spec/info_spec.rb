require 'spec_helper'

describe ElasticsearchServerless::Client do
  context 'API:info' do
    let(:client) do
      ElasticsearchServerless::Client.new(
        api_key: 'api_key',
        url: 'https://my-deployment.elastic.co'
      )
    end

    it 'performs the request' do
      VCR.use_cassette('info') do
        response = client.info
        expect(response.status).to eq 200
        expect(response.headers['x-elastic-product']).to eq 'Elasticsearch'
      end
    end
  end
end
