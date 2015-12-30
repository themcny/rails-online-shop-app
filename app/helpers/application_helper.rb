module ApplicationHelper

def display_error(field)
  if @product.errors[field].any?
    "#{field.capitalize} #{@product.errors[field].first}"
  end
end

@timezone_array = ["UTC-12:00", "UTC-11:00", "UTC-10:00", "UTC-09:00",
                   "UTC-08:00", "UTC-07:00", "UTC-06:00", "UTC-05:00",
                   "UTC-04:00", "UTC-03:00", "UTC-02:00", "UTC-01:00",
                   "UTC-00:00", "UTC+01:00", "UTC+02:00", "UTC+03:00",
                   "UTC+04:00", "UTC+05:00", "UTC+06:00", "UTC+07:00",
                   "UTC+08:00", "UTC+09:00", "UTC+10:00", "UTC+11:00",
                   "UTC+12:00", "UTC+13:00", "UTC+14:00"]

def display_user_error(field)
  if @user.errors[field].any?
    "#{field.capitalize} #{@user.errors[field].first}"
  end
end

def time_zone_conversion(time_zone)
  @timezones_hash = {
      "UTC-12:00" => -12,
      "UTC-11:00" => -11,
      "UTC-10:00" => -10,
      "UTC-09:00" => -9,
      "UTC-08:00" => -8,
      "UTC-07:00" => -7,
      "UTC-06:00" => -6,
      "UTC-05:00" => -5,
      "UTC-04:00" => -4,
      "UTC-03:00" => -3,
      "UTC-02:00" => -2,
      "UTC-01:00" => -1,
      "UTC-00:00" => 0,
      "UTC+01:00" => 1,
      "UTC+02:00" => 2,
      "UTC+03:00" => 3,
      "UTC+04:00" => 4,
      "UTC+05:00" => 5,
      "UTC+06:00" => 6,
      "UTC+07:00" => 7,
      "UTC+08:00" => 8,
      "UTC+09:00" => 9,
      "UTC+10:00" =>10,
      "UTC+11:00" =>11,
      "UTC+12:00" =>12,
      "UTC+13:00" =>13,
      "UTC+14:00" =>14,
      }
end
end
