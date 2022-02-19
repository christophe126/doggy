class PensionsController < ApplicationController
  #   authorize @pension

  def index
    @pensions = policy_scope(Pension)
    @pensions = Pension.all
  end
end
