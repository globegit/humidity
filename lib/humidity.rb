module Humidity

   # Calculate relative humidity(%) given and elevation(M), dry bulb temperature(C)
   # and wet bulb temperature(C).  At least verifies against
   # http://www.fridgetech.com/calculators/rel-hum-a.html
   # though the above truncates the decimal :(

   def Humidity.calculate ( elevation, drybulbtemp, wetbulbtemp )     
    raise ArgumentError.new "Bad RH temperature values" if 
     drybulbtemp < -30.0 || drybulbtemp > 200.0 || wetbulbtemp < -30.0 || 
     wetbulbtemp > 200.0 || wetbulbtemp >= drybulbtemp

       # station pres from standard pres
       n2 = 0.190284
       p22 = 1013.2**n2
       p23 = 0.000084288 * elevation
       p24 = 1/n2
       press = (p22 - p23)**p24 + 0.3
       tk = drybulbtemp + 273.15
       tw = wetbulbtemp + 273.15
       xwd = 21.40 - 5351 / tk
       xww = 21.40 - 5351 / tw
       ewd = Math.exp(xwd)
       eww = Math.exp(xww) 

       # calculate the vapor pressure and saturation vapor pressure
       e = eww - press * (tk - tw) / 1555
       es = ewd

       # calculate relative humidity
       rh = 100 * (e/es)
       return rh
   end

end
