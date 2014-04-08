json.array!(@users) do |user|
  json.extract! user, :id, :username, :crypted_password, :salt, :isadmin
  json.url user_url(user, format: :json)
end
