class Nbjour
  def initialize(start_date, end_date)
    @start = start_date
    @end = end_date
  end

  def cal_nb_jours
    (@end.to_date - @start.to_date).to_i + 1
  end
end
