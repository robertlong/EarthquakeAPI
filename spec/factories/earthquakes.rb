require 'faker'

@rand = Random.new()

FactoryGirl.define do
  factory :earthquake do |f|
    f.id { @rand.integer(1000000) }
    f.src { Faker::Lorem.characters(2) }
    f.version { @rand.integer(9) }
    f.datetime { @rand.rand(10.days).ago }
    f.lat { Faker::Address.latitude}
    f.long { Faker::Address.longitude}
    f.magnitude { @rand.rand(10) }
    f.depth { @rand.rand(-200..200) }
    f.nst { @rand.integer(200)}
    f.region { Faker::Address.city + ', ' + Faker::Address.state }
  end
end
