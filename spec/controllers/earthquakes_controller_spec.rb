require 'spec_helper'

describe EarthquakesController do

  describe '/earthquakes.json' do

    it 'should return all earthquakes'

    describe '/earthquakes.json?on=<timestamp>' do
      it 'should return earthquakes on the same day as the timestamp'
      it 'should return an error if the timestamp is invalid'
    end

    describe '/earthquakes.json?since=<timestamp>' do
      it 'should return earthquakes since the timestamp'
      it 'should return an error if the timestamp is invalid'
    end

    describe '/earthquakes.json?over=<magnitude>' do
      it 'should return earthquakes over the given magnitude'
      it 'should return an error if the magnitude is invalid'
    end

    describe '/earthquakes?near=<lat,lon>' do
      it 'should return earthquakes near the coordinates'
      it 'should return an error if the coordinates is invalid'
    end

    describe '/earthquakes.json?on=<timestamp>&since=<timestamp>' do
      it 'should return earthquakes between the given timestamps'
      it 'should return an error if either of the timestamps are invalid'
      it 'should work in the reverse order'
    end

    describe 'Combined queries' do
      it '/earthquakes.json?over=<magnitude>&near=<lat,lon> should return valid'
      it '/earthquakes.json?since=<timestamp>&over=<magnitude>&near=<lat,lon> should return valid'
      it '/earthquakes.json?on=<timestamp>&since=<timestamp>&over=<magnitude>&near=<lat,lon> should return valid'
    end

  end

end
