json.user do
  json.call(
    @user,
    :id,
    :email,
    :mobile_token
  )
end