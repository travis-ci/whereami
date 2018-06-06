# frozen_string_literal: true

describe Whereami::App do
  subject { described_class }

  def app
    Whereami::App
  end

  let :body do
    JSON.parse(last_response.body)
  end

  describe 'GET /' do
    before do
      get '/'
    end

    it 'provides infra' do
      expect(last_response).to be_ok
      expect(body).to include('infra')
    end
  end
end
