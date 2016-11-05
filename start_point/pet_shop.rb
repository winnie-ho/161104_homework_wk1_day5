require ('pry-byebug')

def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(account)
  return account[:admin][:total_cash]
end

def add_or_remove_cash(account, amount)
  account[:admin][:total_cash] = account[:admin][:total_cash] + amount
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
  matching_names={}
    while counter<shop[:pets].length
      if shop[:pets][counter][:name].include?(pet_name)==true
      matching_names[:name]=pet_name
      end
    counter+=1
    end

    if matching_names.length ==0
      return nil
    else
      return matching_names
    end
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






