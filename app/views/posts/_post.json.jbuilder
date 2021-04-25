json.extract! post, :id, :content, :account_id, :created_at, :updated_at
json.url post_url(post, format: :json)
