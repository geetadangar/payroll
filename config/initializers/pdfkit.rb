# config/initializers/pdfkit.rb
  PDFKit.configure do |config|
    config.wkhtmltopdf = './wkhtmltopdf'
    config.default_options = {
      :page_size => 'Legal',
      :print_media_type => true
    }
    config.default_options[:quite] = false
  # Use only if your external hostname is unavailable on the server.
    config.root_url = "http://localhost:3000"
    config.verbose = false
  end