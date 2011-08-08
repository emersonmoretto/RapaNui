# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RapaNui::Application.initialize!


$disk_threshold = 85
$rack_temperature_threshold = 27
$monitor_sleep = 10*60