class Api::V1::TeamsController < ApplicationController
  def show
    respond_with Team.all
  end

  def create
    team = Team.new(team_params)
    if team.save
      render json: team, status: 201, location: [:api, team]
    else
      render json: { errors: team.errors }, status: 422
    end
  end

  private

    def team_params
      params.require(:team).permit(:name, :organization_id)
    end
end
