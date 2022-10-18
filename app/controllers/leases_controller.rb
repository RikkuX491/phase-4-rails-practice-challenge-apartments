class LeasesController < ApplicationController
    def create
        new_lease = Lease.create(rent: params[:rent], apartment_id: params[:apartment_id], tenant_id: params[:tenant_id])
        render json: new_lease, status: :created
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        if lease
            lease.destroy
            render json: {}, status: :no_content
        else
            render json: { error: "Lease Not Found!" }, status: :not_found
        end
    end
end
