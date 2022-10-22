class Public::AddressesController < ApplicationController
def index
  @address = Address.new
  @addresses = Address.where(customer_id: current_customer.id)
end

def edit
    @address = Address.find(params[:id])
end

def create
  @addresses = Address.new(addresses_params)
  @addresses.customer_id = current_customer.id
      if @addresses.save
      redirect_to public_addresses_path
      else
      redirect_to public_addresses_path
      end
end

def update
       @addresses = Address.find(params[:id])
       @addresses.update(addresses_params)
    redirect_to public_addresses_path

end

def destroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
    redirect_to public_addresses_path
end

private
  def addresses_params
      params.require(:address).permit(:name, :postal_code, :address)
  end

end


