ActiveRecord::Schema.define(:version => 20170112171555) do

  create_table "entities", :force => true do |t|
    t.string  "name"
    t.string  "title"
    t.string  "text"
    t.integer "entity_id"
    t.integer "order_number"
    t.string  "url_path"
  end

end
