class PensionsController < ApplicationController
  authorize @pension

  def index
    @pensions = policy_scope(Pension).order(created_at: :desc)
  end
end
