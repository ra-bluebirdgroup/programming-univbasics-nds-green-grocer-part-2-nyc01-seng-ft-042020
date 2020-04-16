require_relative './part_1_solution.rb'

cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
    {:item => "AVOCADO", :price => 3.00, :clearance => true},
    {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
    {:item => "AVOCADO", :price => 3.00, :clearance => true},
    {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "KALE", :price => 3.00, :clearance => false},
  {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
  {:item => "ALMONDS", :price => 9.00, :clearance => false},
  {:item => "TEMPEH", :price => 3.00, :clearance => true},
  {:item => "CHEESE", :price => 6.50, :clearance => false},
  {:item => "BEER", :price => 13.00, :clearance => false},
    {:item => "BEER", :price => 13.00, :clearance => false},
      {:item => "BEER", :price => 13.00, :clearance => false},
  {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
  {:item => "BEETS", :price => 2.50, :clearance => false},
  {:item => "SOY MILK", :price => 4.50, :clearance => true}
]

coupons = [
  {:item => "AVOCADO", :num => 3, :cost => 5.00},
   {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]


# def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  new_cart = consolidate_cart(cart)
   new_cart.clone.each do |product_hash|
    coupons.each do |coupon_hash|
      if product_hash[:item] == coupon_hash[:item] && product_hash[:count] % coupon_hash[:num] == 0 && product_hash[:count] > 1
        product_hash[:item] = "#{product_hash[:item]} W/COUPON" ##{product_hash[:item]}
        v = product_hash[:count] / coupon_hash[:num]
        product_hash[:price] = coupon_hash[:cost] * v#/ v / product_hash[:count]
      elsif product_hash[:item] == coupon_hash[:item] && product_hash[:count] % coupon_hash[:num] != 0 && product_hash[:count] > 1
        temp_hash = {}
        temp_hash.merge!(product_hash)
        temp_hash[:count] = 1


        product_hash[:count] -=  1
        if product_hash[:item] == coupon_hash[:item] && product_hash[:count] % coupon_hash[:num] == 0 && product_hash[:count] > 1
          product_hash[:item] = "#{product_hash[:item]} W/COUPON"
          v = product_hash[:count] / coupon_hash[:num]
          product_hash[:price] = coupon_hash[:cost] * v
        end
        new_cart << temp_hash
      end

    end
  end

   p new_cart

  #
  # REMEMBER: This method **should** update cart
# end
#

# def apply_clearance(cart)
#   # Consult README for inputs and outputs
#   #
#   # REMEMBER: This method **should** update cart
# end
#
# def checkout(cart, coupons)
#   # Consult README for inputs and outputs
#   #
#   # This method should call
#   # * consolidate_cart
#   # * apply_coupons
#   # * apply_clearance
#   #
#   # BEFORE it begins the work of calculating the total (or else you might have
#   # some irritated customers
# end
