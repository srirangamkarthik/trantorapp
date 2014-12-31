json.array!(@login_forms) do |login_form|
  json.extract! login_form, :id, :game, :score
  json.url login_form_url(login_form, format: :json)
end
