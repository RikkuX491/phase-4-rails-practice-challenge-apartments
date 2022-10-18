class TenantsController < ApplicationController
    def index
        tenants = Tenant.all
        render json: tenants, status: :ok
    end

    def show
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            render json: tenant, status: :ok
        else
            render json: { error: "Tenant Not Found!" }, status: :not_found
        end
    end

    def create
        new_tenant = Tenant.create(name: params[:name], age: params[:age])
        if new_tenant.valid?
            render json: new_tenant, status: :created
        else
            render json: { errors: new_tenant.errors }, status: :unprocessable_entity
        end
    end

    def update
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.update(name: params[:name], age: params[:age])
            if tenant.valid?
                return render json: tenant, status: :ok
            else
                return render json: { errors: tenant.errors }, status: :unprocessable_entity
            end
        else
            return render json: { error: "Tenant Not Found!" }, status: :not_found
        end
    end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            tenant.destroy
            render json: {}, status: :no_content
        else
            render json: { error: "Tenant Not Found!" }, status: :not_found
        end
    end
end
