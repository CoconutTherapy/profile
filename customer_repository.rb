require 'csv'
require_relative "../models/customer"
require_relative "base_repository"

class CustomerRepository < BaseRepository
  def all
    @elements
  end

  def add(customer)
    @elements << customer
    customer.id = @next_id
    @next_id += 1
    save
  end

  private

  def parse_row(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end

  def csv_headers
    ['id', 'name', 'address']
  end
end
