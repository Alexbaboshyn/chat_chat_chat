require 'rails_helper'

RSpec.describe Api::MarkAsReadsController, type: :controller do
  it { should route(:get, 'api/chats/1/mark_as_reads').to(action: :show) }

  # describe '#show' do
  #
  # end


end
