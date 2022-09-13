#!/bin/bash

# Make sure the application is ready to upload
esphome weather_mqtt.yaml compile

echo "Preventing deep sleep mode on next wake up"
mosquitto_pub -u $1 -P $2 -p 1883 -t "weather_01/deep_sleep_mode" -m "prevent" -r

echo "Waiting for reset of deep sleep mode by device"
mosquitto_sub -u $1 -P $2 -p 1883 -t "weather_01/deep_sleep_mode" -C 2

echo "Upload untill succeeded"
until esphome weather_mqtt.yaml upload
do
  sleep 0.1
done
