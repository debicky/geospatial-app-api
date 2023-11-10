module Geospatial
  module V1
    class Tickets < Grape::API
      resource :tickets do
        desc "Return all users"
        get "" do
          Ticket.all
        end
        desc "Return a user"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id" do
          Ticket.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end