module AuraPrint
    def self.barcodeWeb(sku)
        require 'unirest'
        Unirest.post('http://10.0.2.232/printer/aura.php',
                     parameters: { sku: sku, printer: 'Stage1' })

        return "Success"
    end

    def self.systemPrint(sku)
        require 'barby'
        require 'barby/barcode/code_128'
        require 'barby/outputter/html_outputter'

        barcode = Barby::Code128B.new(sku)
        return barcode.to_html
    end
end
