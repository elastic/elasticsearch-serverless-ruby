require 'spec_helper'

describe ElasticsearchServerless::Client do
  context 'API:bulk' do
    let(:client) do
      ElasticsearchServerless::Client.new(
        api_key: 'api_key',
        url: 'https://my-deployment.elastic.co'
      )
    end

    it 'performs the request' do
      VCR.use_cassette('bulk') do
        body = [
          { index: { _index: 'books', _id: '42' } },
          { name: "The Hitchhiker's Guide to the Galaxy", author: 'Douglas Adams', release_date: '1979-10-12', page_count: 180},
          { index: { _index: 'books', _id: '43' } },
          { name: 'Snow Crash', author: 'Neal Stephenson', release_date: '1992-06-01', page_count: 470 },
          { index: { _index: 'books', _id: '44' } },
          { name: 'Starship Troopers', author: 'Robert A. Heinlein', release_date: '1959-12-01', page_count: 335}
        ]
        response = client.bulk(body: body)
        expect(response.status).to eq 200
        expect(response.headers['x-elastic-product']).to eq 'Elasticsearch'
        expect(response['items'].count).to eq 3
      end
    end
  end
end
