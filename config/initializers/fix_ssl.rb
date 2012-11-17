#This fix is not considered very secure by some. This is a fix for a Ruby "OpenSSL::SSL::SSLError: SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed" error and was found at http://jimneath.org/2011/10/19/ruby-ssl-certificate-verify-failed.html
require 'open-uri'
require 'net/https'

module Net
  class HTTP
    alias_method :original_use_ssl=, :use_ssl=
    
    def use_ssl=(flag)
      self.ca_file = Rails.root.join('lib/ca-bundle.crt').to_s
      self.verify_mode = OpenSSL::SSL::VERIFY_PEER
      self.original_use_ssl = flag
    end
  end
end
