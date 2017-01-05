require 'yaml'
module AuraPrint
    @config = {
        print_address: 'http://10.0.2.232/printer/aura.php',
        printer: 'Stage1'
    }

    @valid_config_keys = @config.keys

    # Configure through hash
    def self.configure(opts = {})
        opts.each { |k, v| @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym }
    end

    # Configure through yaml file
    def self.configure_with(path_to_yaml_file)
        begin
            config = YAML.load(IO.read(path_to_yaml_file))
        rescue Errno::ENOENT
            puts "YAML configuration file couldn't be found. Using defaults."; return
        rescue Psych::SyntaxError
            puts 'YAML configuration file contains invalid syntax. Using defaults.'; return
        end

        configure(config)
    end

    def self.config
        @config
    end

    def self.barcodeWeb(sku)
        require 'unirest'
        Unirest.post('http://10.0.2.232/printer/aura.php',
                     parameters: { sku: sku, printer: 'Stage1' })

        'Success'
    end

    def self.systemPrintImage(sku)
      require 'barby'
      require 'barby/barcode/code_128'
      require 'rmagick'
      require 'chunky_png'
      require 'barby/outputter/rmagick_outputter'
      barcode = Barby::Code128B.new(sku)
      img = barcode.to_image
      img.format = 'png'
      imgCode = Base64.encode64(@img.to_blob).gsub(/\n/, "")
        "<img src='data:image/png;base64,#{imgCode}' />".html_safe
    end

    def self.barcodeWeb(sku, printer)
        require 'unirest'
        Unirest.post('http://10.0.2.232/printer/aura.php',
                     parameters: { sku: sku, printer: printer })

        'Success'
    end

    def self.systemPrint(sku)
        require 'barby'
        require 'barby/barcode/code_128'
        require 'barby/outputter/html_outputter'

        barcode = Barby::Code128B.new(sku)
        barcode.to_html
    end
end
