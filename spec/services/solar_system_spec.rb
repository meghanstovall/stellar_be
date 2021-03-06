require 'spec_helper'
require './app/services/solar_system_service.rb'

RSpec.describe "Solar System Api", type: :request do
  it "can get response with a single body", :vcr do
    response = SolarSystemService.get_response("mars")

    expect(response.class).to eq(Hash)
    expect(response[:name]).to eq("Mars")
    expect(response.has_key?(:id)).to eq(true)
    expect(response.has_key?(:isPlanet)).to eq(true)
    expect(response.has_key?(:moons)).to eq(true)
  end

  it "can get a generic search for a single body", :vcr do
    response = SolarSystemService.get_response("kale")

    expect(response.class).to eq(Hash)
    expect(response[:name]).to eq("Calé")
    expect(response.has_key?(:id)).to eq(true)
    expect(response.has_key?(:isPlanet)).to eq(true)
    expect(response.has_key?(:moons)).to eq(true)
  end

  it "will return nil if search term was not found", :vcr do
    response = SolarSystemService.get_response("planet")

    expect(response).to eq(nil)
  end
end
