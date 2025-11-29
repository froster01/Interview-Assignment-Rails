require "pagy/extras/metadata"
require "pagy/extras/overflow"

Pagy::DEFAULT[:overflow] = :empty_page

# Configure which metadata fields to include in API responses
# Only include the essential pagination info
Pagy::DEFAULT[:metadata] = [ :count, :page, :items, :pages, :last, :from, :to, :prev, :next ]
