Time::DATE_FORMATS[:db2] = '%Y-%m-%d %H:%M:%S'
Time::DATE_FORMATS[:default] = ->(time){
  Time.zone = 'Beijing'
  t = Time.zone.at time
  t.strftime '%Y-%m-%d %H:%M:%S'
}
Time::DATE_FORMATS[:datetime] = '%Y-%m-%d %H:%M'

class ActiveSupport::TimeWithZone

  def as_json(options = {})
    strftime('%Y-%m-%d %H:%M:%S')
  end

end
