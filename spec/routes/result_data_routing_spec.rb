# frozen_string_literal: true

RSpec.describe 'ResultData routing', type: :routing do
  it 'routes POST /api/result_data to api/result_data#create' do
    expect(post: '/api/result_data').to route_to('api/result_data#create')
  end

  it 'does not route GET /api/result_data' do
    expect(get: '/api/result_data').not_to be_routable
  end

  it 'does not route PUT /api/result_data' do
    expect(put: '/api/result_data').not_to be_routable
  end

  it 'does not route PATCH /api/result_data' do
    expect(patch: '/api/result_data').not_to be_routable
  end

  it 'does not route DELETE /api/result_data' do
    expect(delete: '/api/result_data').not_to be_routable
  end
end
