class Settings < RailsSettings::CachedSettings
  def self.increace_total_stairs_sold
    if Settings.total_stairs_sold.present?
      today = Time.now
      if today.saturday? || today.sunday?
        Settings.total_stairs_sold = Settings.total_stairs_sold.to_i + rand(0..2)
      else
        Settings.total_stairs_sold = Settings.total_stairs_sold.to_i + rand(1..4)
      end
    else
      Settings.total_stairs_sold = '0'
    end
  end
end
