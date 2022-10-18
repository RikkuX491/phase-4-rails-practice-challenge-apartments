class ApartmentsController < ApplicationController
    def index
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    def show
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            render json: apartment, status: :ok
        else
            render json: { error: "Apartment Not Found" }, status: :not_found
        end
    end

    def create
        new_apartment = Apartment.create(number: params[:number])
        render json: new_apartment, status: :created
    end

    def update
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.update(number: params[:number])
            render json: apartment, status: :ok
        else
            render json: { error: "Apartment Not Found" }, status: :not_found
        end        
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            render json: {}, status: :ok
        else
            render json: { error: "Apartment Not Found" }, status: :not_found
        end
    end
end
