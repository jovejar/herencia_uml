require 'byebug'
class Appointment
    attr_accessor :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
      @location = location
      @purpose = purpose
      @hour = hour
      @min = min
    end
end


class MonthlyAppointment < Appointment
    def initialize(location,purpose,hour,min,day)
        super(location,purpose,hour,min)
        @day = day
    end 
    def to_s
        "Reunion mensual en #{location} sobre #{purpose} el dia #{@day} a las #{hour}: #{min}"
    end 

    def occurs_on?(day)
        #@day == day ? true : false
        @day == day  
    end
end

puts MonthlyAppointment.new('Nasa', 'Aliens', 8, 15, 23)
# Reunión mensual en NASA sobre Aliens el día 23 a la(s) 8:15.

class DailyAppointment < Appointment
    
    def to_s 
        "Reunion diaria en #{@location} sobre Educaciòn a las #{hour}"
    end 

    def occurs_on?(hour,min)
        #@hour == hour && @min == min ? true : false
        @hour == hour && @min == min  
    end
end

puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
# Reunión diaria en Desafío Latam sobre Educación a la(s) 8:15.

class OneTimeAppointment < Appointment
    attr_accessor :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location,purpose,hour,min)
        @day = day
        @month = month
        @year = year
    end

    def to_s 
        "Reunion ùnica en Desafio Latam sobre el trabajo el #{day} #{month} #{year} a las #{hour}"
    end
    
    def occurs_on?(day, month, year)
        #@day == day && @month == month && @year == year ? true : false 
        @day == day && @month == month && @year == year  
    end
end

puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
# Reunión única en Desafío Latam sobre Trabajo el 4/6/2019 a la(s) 14:30.