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
      VCR.use_cassette('search') do
        body = [
          { index: { _index: 'books', _id: '42' } },
          { name: "The Hitchhiker's Guide to the Galaxy", author: 'Douglas Adams', release_date: '1979-10-12', page_count: 180},
          { index: { _index: 'books', _id: '43' } },
          { name: 'Snow Crash', author: 'Neal Stephenson', release_date: '1992-06-01', page_count: 470 },
          { index: { _index: 'books', _id: '44' } },
          { name: 'Starship Troopers', author: 'Robert A. Heinlein', release_date: '1959-12-01', page_count: 335}
        ]
        client.bulk(body: body)
        response = client.search(index: 'books', q: 'snow')
        expect(response.status).to eq 200
        expect(response['hits']['hits'].first['_source']).to eq ({
          'name' => 'Snow Crash',
          'author' => 'Neal Stephenson',
          'release_date' => '1992-06-01',
          'page_count' => 470
        })
      end
    end
  end
end
