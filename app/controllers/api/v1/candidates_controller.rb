class Api::V1::CandidatesController < ApplicationController

    def index
        @candidates = Candidate.page(page).per(per_page)
        render json: @candidates
    end

    def show
        @candidate = Candidate.find(params[:id])
        render json: @candidate
    end

    def create 
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            render json: @candidate
        else
            render json: {error: "Unable to create candidate"}, status: 400
        end
    end

    def update
        @candidate = Candidate.find(params[:id])
        if @candidate
            @candidate.update(candidate_params)
            render json: { message: "Candidate update successfully"}, status: 200
        else
            render json: { error: "Unable to update candidate"}, status: 400
        end
    end

    private

    def candidate_params
        params.require(:candidate).permit(:name, :email, :phone_number, :address)
    end

    def page
        @page ||= params[:page] || 1
    end

    def per_page
        @per_page ||= params[:per_page] || 10
    end

end
