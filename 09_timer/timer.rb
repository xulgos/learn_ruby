class Timer

  def time_string
    format "%02d:%02d:%02d", hours, residual_minutes, residual_seconds
  end

  def hours
    minutes/60
  end

  def minutes
    seconds/60
  end

  def seconds
    @seconds ||= 0
  end

  def seconds= number
    @seconds = number
  end

  def residual_minutes
    minutes % 60
  end

  def residual_seconds
    seconds % 60
  end
end
