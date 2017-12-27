json.extract! note, :id, :body, :title, :created_at, :updated_at
json.url note_url(note, format: :json)
