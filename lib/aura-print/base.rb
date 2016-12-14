module AuraPrint
  response = Unirest.post "http://httpbin.org/post",
                        headers:{ "Accept" => "application/json" },
                        parameters:{ :sku => 23, :printer => "Sales" }
  response.code # Status code
  response.headers # Response headers
  response.body # Parsed body
  response.raw_body # Unparsed body
end
