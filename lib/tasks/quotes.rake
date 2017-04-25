namespace :quotes do
  desc "TODO"
  task from_yml: :environment do
    quotes = YAML::load(File.open("#{Rails.root}/config/quote_data/quotes.yml"))
    quotes.each do |quote|
      quote = quote.symbolize_keys
      author = quote[:author].symbolize_keys
      Quote.find_or_create_by!(body: quote[:body]) do |q|
        q.body        = quote[:body]
        q.category    = "wisdom"
        q.tags        = quote[:tags]
        q.terms       = quote[:terms]
        q.slug        = author[:author_name]
        q.author_name = author[:author_name]
        q.source      = quote[:custom_meta][:source]
        q.save
      end
    end

  end

end
