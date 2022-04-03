json.array! @products do |product|
  json.adi product.name
  json.aciklama product.description
  json.miktar product.quantity
  json.fiyat product.price

  json.category product.category.name

  if ((defined? product.product_image) && (product.product_image.filename != nil))
    json.image rails_blob_url(product.product_image)
  end
end