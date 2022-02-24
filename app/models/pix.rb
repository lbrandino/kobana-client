class Pix
  def initialize(attributes=nil)
    @attributes = attributes 
  end

  def id
    @attributes['id'] 
  end

  def amount
    @attributes['amount'] 
  end

  def txid 
    @attributes['id']
  end

  def qrcode_emv 
    @attributes.dig('qrcode', 'emv')
  end

  def qrcode_png 
    @attributes.dig('qrcode', 'png')
  end
  
  def status 
    @attributes['status'] 
  end

  def name 
    @attributes.dig('payer', 'name')
  end

  def document_number   
    @attributes.dig('payer', 'document_number')
  end

  def created_at
     @attributes['created_at']
  end

  def expire_at
    @attributes['expire_at']
  end

end