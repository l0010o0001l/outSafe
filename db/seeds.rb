User.create!([{
  email: "test@seeds.com",
  password: "s33dziez!",
  password_confirmation: "s33dziez!",
  active: TRUE
}])

Party.create!([{
  title: "Swagga Fest",
  address: "2059 Overton St. Portland, OR 97205",
  min_age: "21"
}])

Party.create!([{
  title: "Insanely Authentic Coffee Meet",
  address: "521 SE Division St. Portland, OR 97291",
  min_age: "63"
}])
