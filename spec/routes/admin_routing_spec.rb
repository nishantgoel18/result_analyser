# frozen_string_literal: true

RSpec.describe 'Admin routing', type: :routing do
  it 'routes POST /admin/results to admin/results#create' do
    expect(post: '/admin/results').to route_to('admin/results#create')
  end

  it 'does route GET /admin/results' do
    expect(get: '/admin/results').to route_to('admin/results#index')
  end

  it 'does route GET /admin/results/new' do
    expect(get: '/admin/results/new').to route_to('admin/results#new')
  end

  it 'routes GET /admin/daily_result_stats to admin/daily_result_stats#index' do
    expect(get: '/admin/daily_result_stats').to route_to('admin/daily_result_stats#index')
  end


  it 'does not route PUT /admin/daily_result_stats' do
    expect(put: '/admin/daily_result_stats').not_to be_routable
  end

  it 'does not route PATCH /admin/daily_result_stats' do
    expect(patch: '/admin/daily_result_stats').not_to be_routable
  end

  it 'routes GET /admin/monthly_result_averages to admin/monthly_result_averages#index' do
    expect(get: '/admin/monthly_result_averages').to route_to('admin/monthly_result_averages#index')
  end


  it 'does not route PUT /admin/monthly_result_averages' do
    expect(put: '/admin/monthly_result_averages').not_to be_routable
  end

  it 'does not route PATCH /admin/monthly_result_averages' do
    expect(patch: '/admin/monthly_result_averages').not_to be_routable
  end

end
