require ('pry-byebug')

def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(account)
  return account[:admin][:total_cash]
end

def add_or_remove_cash(account, amount)
  return account[:admin][:total_cash] = account[:admin][:total_cash] + amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, no_pets_sold)
  shop[:admin][:pets_sold]=shop[:admin][:pets_sold]+no_pets_sold
end

def stock_count (shop)
  return shop[:pets].length
end


def pets_by_breed(shop, breed_name)
counter = 0
matches = []  
  while counter<shop[:pets].length
    if
      shop[:pets][counter][:breed].include?(breed_name)==true
      matches<<1
    end
    counter+=1
  end
  return matches
end


def all_pets_by_breed(shop,breed_search)
counter = 0
matches = []
  while counter<shop[:pets].length
      if
        shop[:pets][counter][:breed].include?(breed_search)==true
        matches<<1
      end
      counter+=1
  end
  return matches
end


def find_pet_by_name(shop, pet_name)
  counter = 0
  pet_index = 0 
  matching_names={}
    while counter<shop[:pets].length
      if shop[:pets][counter][:name].include?(pet_name)==true
      matching_names[:name]=pet_name
      pet_index=counter
      end
    counter+=1
    end

    if matching_names.length ==0
      return nil
    else
      return matching_names
    end

    return pet_index
end


def remove_pet_by_name(shop,name_to_remove)
  counter = 0
    while counter<shop[:pets].length
        if shop[:pets][counter][:name].include?(name_to_remove)==true
         shop[:pets].delete_at(counter)
        end
        counter+=1
    end

  find_counter=0
    while find_counter<shop[:pets].length
      unless shop[:pets][find_counter][:name].include?(name_to_remove)==true
        deleted_animals = nil 
      end
      find_counter+=1 
    end
end


def add_pet_to_stock(shop, pet_added_to_stock)
  shop[:pets]<<pet_added_to_stock
  return shop[:pets].count
end


def customer_pet_count(customer)
  return customer[:pets].length
end


def add_pet_to_customer(customer, new_pet_bought)
  customer[:pets]<<new_pet_bought
  return customer[:pets].count
end


# # OPTIONAL

def customer_can_afford_pet (customer, new_pet)
  if customer[:cash] < new_pet[:price]
    return false
  else
    return true
  end
end


# Integration Tests
def sell_pet_to_customer(shop, pet, customer)
  #updating the customers pet count now that that they have bought a pet.

  add_pet_to_customer(customer, pet)

  increase_pets_sold(shop,pet.count)
  pets_sold(shop)

  index = 0
  counter = 0
    while counter<shop[:pets].length
        if shop[:pets][counter][:name].include?(pet.values[0])==true
         index = counter
        end
        counter+=1
    end
  add_or_remove_cash(shop, shop[:pets][index][:price])

end