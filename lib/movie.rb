class Movie
  attr_reader :name, :producer, :year

  def initialize(params)
    @name = params[:name]
    @producer = params[:producer]
    @year = params[:year]
  end

  def to_s
    "#{@producer} - #{@name} (#{@year})"
  end
end
