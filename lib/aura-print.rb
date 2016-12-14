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
        barcode = Barby::Code128B.new(sku)
        return barcode
    end
end
