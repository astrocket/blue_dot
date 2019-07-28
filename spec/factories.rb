FactoryBot.define do
  factory :traveling do
    world { nil }
    city { nil }
  end

  factory :world do
    user { nil }
  end

  factory :user do
    
  end

  factory :city do
    name { "MyString" }
    name_ascii { "MyString" }
    lat { "MyString" }
    lng { "MyString" }
    country { "MyString" }
    iso2 { "MyString" }
    iso3 { "MyString" }
    admin_name { "MyString" }
    capital { "MyString" }
    population { "MyString" }
    simple_map_id { "MyString" }
  end

  factory :admin_user do
    
  end


end