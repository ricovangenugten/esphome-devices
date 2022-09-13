# keep trying to upload untill succeeded
esphome weather_mqtt.yaml compile
until esphome weather_mqtt.yaml upload
do
  sleep 0.1
done
