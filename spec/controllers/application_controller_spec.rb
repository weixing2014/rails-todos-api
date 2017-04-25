require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let!(:user) { create(:user) }
  let(:headers) { { 'Authorization' => token_generator(user.id) } }
  let(:invalid_headers) { { 'Authorization' => '' } }

  describe "#authorize_request" do
    context 'When auth token is passed' do
      before { allow(request).to receive(:headers).and_return(headers) }

      it 'sets the current user' do
        expect(subject.send(:authorize_request)).to eq(user)
      end
    end

    context 'When auth token is not passed' do
      before { allow(request).to receive(:headers).and_return(invalid_headers) }

      it 'sets the current user' do
        expect { subject.send(:authorize_request) }
          .to raise_error(ExceptionHandler::MissingTokenError, /Missing/)
      end
    end
  end
end
