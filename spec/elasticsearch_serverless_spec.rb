require 'spec_helper'

describe ElasticsearchServerless::Client do
  context 'instantiation' do
    it 'raises an error when no url is passed' do
      expect{ ElasticsearchServerless::Client.new(api_key: 'test') }.
        to raise_error(ArgumentError, 'missing keyword: :url')
    end

    it 'raises an error when no api_key is passed' do
      expect{ ElasticsearchServerless::Client.new(url: 'test') }.
        to raise_error(ArgumentError, 'missing keyword: :api_key')
    end

    it 'instantiates a client' do
      expect(ElasticsearchServerless::Client.new(url: 'test', api_key: 'test')).
        to be_an_instance_of ElasticsearchServerless::Client
    end

    it 'integrates with Elastic Transport' do
      transport = double(Elastic::Transport::Client)
      allow(Elastic::Transport::Client).to receive(:new).
                                             with(
                                               {
                                                 host: 'test',
                                                 transport_options: { headers: {"Authorization"=>"ApiKey test" } }
                                               }
                                             ).and_return(transport)
      client = ElasticsearchServerless::Client.new(api_key: 'test', url: 'test')

      allow(transport).to receive(:perform_request).with('GET', '/')
      client.perform_request('GET', '/')
    end
  end
end
